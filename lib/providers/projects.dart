/**
    A provider class that allows to perform CRUD operations on the projects,
    corresponding to the Attivita entity, and notifies the interested widgets of any state changes.
 **/

import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import '../models/Attivita.dart';
import '../models/Cliente.dart';
import '../models/Collega.dart';
import '../models/CollegaAttivita.dart';
import '../models/Release.dart';
import '../models/referenteCliente.dart';

class Projects with ChangeNotifier {
  List<Attivita?> _projects = [];
  bool ascendingOrder = false;

  double? total_stima = 0.0;
  double? total_etc = 0.0;
  double? total_consuntivato = 0.0;
  double? total_efficienza = 0.0;

  List<bool> selectedDate = <bool>[true, false];

  String? selectedCustomerId;
  String? selectedReleaseId;
  String? selectedColleagueId;
  String? selectedReferentId;

  List<Attivita?> get projects {
    return [..._projects];
  }

  bool isEmpty() {
    return _projects.isEmpty;
  }

  Future<void> fetchAndSetProjects() async {
    try {
      String customerId = selectedCustomerId != null
          ? 'attivitaClienteIDId: {eq: "$selectedCustomerId"},'
          : '';
      String releaseId = selectedReleaseId != null
          ? 'attivitaTargetId: {eq: "$selectedReleaseId"},'
          : '';
      String internalReferent = selectedColleagueId != null
          ? 'attivitaReferenteInternoId: {eq: "$selectedColleagueId"},'
          : '';
      String customerReferent = selectedReferentId != null
          ? 'attivitaReferenteClienteIDId: {eq: "$selectedReferentId"}'
          : '';
      String filter = selectedCustomerId != null ||
              selectedReleaseId != null ||
              selectedColleagueId != null ||
              selectedReferentId != null
          ? '(filter: {$customerId $releaseId $internalReferent $customerReferent})'
          : '';
      String graphQLDocument = '''query listAttivitas {
        listAttivitas$filter  {
          items {
            ReferenteInterno {
              id
              nome
            }
            attivitaReferenteInternoId
            allocazioneCompilata
            clienteID {
              id
              nome
            }
            attivitaReferenteClienteIDId
            attivitaClienteIDId
            codFinanziamento
            consuntivato
            efficenza
            etc
            id
            note
            numCDT
            stato
            stima
            stimaFunzionale
            attivitaTargetId
            target {
              data
              id
              releaseClienteId
              titolo
            }
            titolo
            referenteClienteID {
              id
              email
            }
          }
        }
      }''';
      //print('graphQLDocument: $graphQLDocument');
      var operation = Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument));

      var response = await operation.response;
      var data = response.data;
      //print('Query result: ' + data!);
      if (data == null) {
        print('errors: ${response.errors}');
        _projects = [];
      }
      Map<String, dynamic> extractedData = jsonDecode(data!);
      //print(extractedData);
      List<Attivita?> projectsList =
          (extractedData['listAttivitas']['items'] as List)
              .map((item) => Attivita.fromJson(item))
              .toList();
      //print(projectsList);
      //projectsList.sort((a, b) => a?.target != null && b?.target != null ? a!.target.compareTo(b.target) : 0);
      _projects = projectsList;
      calculateTotals();
      if (ascendingOrder)
        orderBy_ascendingDate();
      else
        orderBy_descendingDate();
    } on ApiException catch (e) {
      print('Query failed: $e');
    } catch (e) {
      print('error $e');
    }
  }

  void calculateTotals() {
    total_consuntivato = 0.0;
    total_etc = 0.0;
    total_stima = 0.0;
    total_efficienza = 0.0;
    for (Attivita? project in _projects) {
      total_stima = (project?.stima != null)
          ? total_stima! + (project?.stima ?? 0.0)
          : total_stima;
      total_etc = (project?.etc != null)
          ? total_etc! + (project?.etc ?? 0.0)
          : total_etc;
      total_consuntivato = (project?.consuntivato != null)
          ? total_consuntivato! + (project?.consuntivato ?? 0.0)
          : total_consuntivato;
    }
    total_efficienza =
        (((total_stima ?? 0) - (total_etc ?? 0) - (total_consuntivato ?? 0)) *
                100) /
            (total_stima ?? 1);
    total_efficienza = total_efficienza ?? 0;
    notifyListeners();
  }

  void orderBy_ascendingDate() {
    _projects.sort((a, b) {
      try {
        TemporalDate? dateA = a?.target?.data;
        TemporalDate? dateB = b?.target?.data;

        int? result;
        result = dateB?.compareTo(dateA!);
        return result ?? -1;
      } catch (e) {
        return 1;
      }
    });
    //null in the endo of the list
    _projects.sort((a, b) => a == null ? 0 : 1);
    ascendingOrder = true;
    notifyListeners();
  }

  void orderBy_descendingDate() {
    _projects.sort((a, b) {
      try {
        TemporalDate? dateA = a?.target?.data;
        TemporalDate? dateB = b?.target?.data;
        int? result;
        result = dateA?.compareTo(dateB!);
        return result ?? -1;
      } catch (e) {
        return 1;
      }
    });
    //null in the endo of the list
    _projects.sort((a, b) => a == null ? 0 : 1);
    ascendingOrder = false;
    notifyListeners();
  }

  Attivita? findById(String? id) {
    if (!exists(id)) return null;
    return _projects.firstWhere((proj) => proj?.id == id);
  }

  bool exists(String? id) {
    if (id == null) return false;
    try {
      Attivita? c = _projects.firstWhere((project) => project?.id == id);
      return c != null ? true : false;
    } catch (Exception) {
      return false;
    }
  }

  Future<int> createProject(
      String? titolo,
      int? stima,
      int? stimaFunzionale,
      double? consuntivato,
      double? etc,
      String? codFinanziamento,
      Cliente? clienteID,
      referenteCliente? referenteClienteID,
      List<CollegaAttivita>? Risorse,
      Collega? ReferenteInterno,
      String? stato,
      String? allocazioneCompilata,
      int? numCDT,
      String? note,
      Release? target,
      String? attivitaClienteIDId,
      String? attivitaReferenteClienteIDId,
      String? attivitaReferenteInternoId,
      String? attivitaTargetId) async {
    try {
      final model = Attivita(
          titolo: titolo,
          stima: stima,
          stimaFunzionale: stimaFunzionale,
          consuntivato: consuntivato,
          etc: etc,
          codFinanziamento: codFinanziamento,
          clienteID: clienteID,
          attivitaClienteIDId: attivitaClienteIDId,
          referenteClienteID: referenteClienteID,
          Risorse: Risorse,
          ReferenteInterno: ReferenteInterno,
          stato: stato,
          allocazioneCompilata: allocazioneCompilata,
          numCDT: numCDT,
          note: note,
          target: target,
          attivitaTargetId: attivitaTargetId,
          attivitaReferenteInternoId:attivitaReferenteInternoId,
          attivitaReferenteClienteIDId:attivitaReferenteClienteIDId,
      );
      final request = ModelMutations.create(model);
      final response = await Amplify.API.mutate(request: request).response;

      final createdAttivita = response.data;
      print(createdAttivita);
      if (createdAttivita == null) {
        safePrint('errors: ${response.errors}');
        return 0;
      }
      safePrint('Mutation result: ${createdAttivita.id}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
    fetchAndSetProjects();
    return 200;
  }

  Future<int> updateProject(
      String id,
      String? titolo,
      int? stima,
      int? stimaFunzionale,
      double? consuntivato,
      double? etc,
      String? codFinanziamento,
      Cliente? clienteID,
      referenteCliente? referenteClienteID,
      List<CollegaAttivita>? Risorse,
      Collega? ReferenteInterno,
      String? stato,
      String? allocazioneCompilata,
      int? numCDT,
      String? note,
      Release? target,
      String? attivitaClienteIDId,
      String? attivitaReferenteClienteIDId,
      String? attivitaReferenteInternoId,
      String? attivitaTargetId) async {
    try {
      final model = Attivita(
          id: id,
          titolo: titolo,
          stima: stima,
          stimaFunzionale: stimaFunzionale,
          consuntivato: consuntivato,
          etc: etc,
          codFinanziamento: codFinanziamento,
          clienteID: clienteID,
          attivitaClienteIDId: attivitaClienteIDId,
          referenteClienteID: referenteClienteID,
          Risorse: Risorse,
          ReferenteInterno: ReferenteInterno,
          stato: stato,
          allocazioneCompilata: allocazioneCompilata,
          numCDT: numCDT,
          note: note,
          target: target,
          attivitaTargetId: attivitaTargetId);
      final request = ModelMutations.update(model);
      final response = await Amplify.API.mutate(request: request).response;

      final updatedAttivita = response.data;
      print(updatedAttivita);
      if (updatedAttivita == null) {
        safePrint('errors: ${response.errors}');
        return 0;
      }
      safePrint('Mutation result: ${updatedAttivita.id}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
    fetchAndSetProjects();
    return 200;
  }

  Future<int> updateProjectById(
      String projectId,
      String? titolo,
      int? stima,
      double? consuntivato,
      double? etc,
      Cliente? cliente,
      referenteCliente? referenteCliente,
      Collega? referenteInterno,
      Release? release) async {
    if (exists(projectId)) {
      try {
        Attivita? originalProject = findById(projectId);
        final updatedModel = originalProject?.copyWith(
            titolo: titolo,
            stima: stima,
            consuntivato: consuntivato,
            etc: etc,
            clienteID: cliente,
            attivitaClienteIDId: cliente?.id,
            referenteClienteID: referenteCliente,
            attivitaReferenteClienteIDId: referenteCliente?.id,
            ReferenteInterno: referenteInterno,
            attivitaReferenteInternoId: referenteInterno?.id,
            target: release,
            attivitaTargetId: release?.id,
        );
        print('UPM: $updatedModel');
        final request =
            updatedModel != null ? ModelMutations.update(updatedModel) : null;
        final response = request != null
            ? await Amplify.API.mutate(request: request).response
            : null;

        final updatedAttivita = response?.data;
        if (updatedAttivita == null) {
          safePrint('errors: ${response?.errors}');
          return 0;
        }
        safePrint('Mutation result: $updatedAttivita');
      } on ApiException catch (e) {
        safePrint('Mutation failed: $e');
      }
      fetchAndSetProjects();
      return 200;
    }
    return 0;
  }

  Future<int> deleteAttivita(Attivita modelToDelete) async {
    //print(modelToDelete);
    try {
      print("qua");
    final request = ModelMutations.delete(modelToDelete);
      print("qua2");
      final response = await Amplify.API.mutate(request: request).response;
      print('Response: $response');
    }catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    _projects.remove(modelToDelete);
    notifyListeners();
    return 200;
  }


}
