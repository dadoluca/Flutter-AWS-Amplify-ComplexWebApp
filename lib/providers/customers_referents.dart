/**
    A provider class that allows to perform CRUD operations on the customers referents,
    corresponding to the referenteCliente entity, and notifies the interested widgets of any state changes.
 **/

import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:reply_project_management/models/ModelProvider.dart';

class CustomersReferents with ChangeNotifier {
  List<referenteCliente?> _referents = [];

  List<referenteCliente?> get referents {
    return [..._referents];
  }

  bool isEmpty() {
    return _referents.isEmpty;
  }

  bool exists(String? id){
    if(id==null) return false;
    try{
      referenteCliente? c = _referents.firstWhere((referent) => referent?.id == id);
      return c!= null ? true : false;
    }catch(Exception){return false;}
  }


  referenteCliente? findById(String? id) {
    if(!exists(id)) return null;
    return _referents.firstWhere((proj) => proj?.id == id);
  }

  Future<void> fetchAndSetReferents([String customerId = '']) async {
    try {
      String filter = customerId == ''
          ? ''
          : '(filter: {referenteClienteClienteId: {eq: "$customerId"}})';
      String graphQLDocument = '''query listReferenteClientes {
        listReferenteClientes$filter {
          items {
            id
            email
            cliente {
              nome
              colore
              id
            }
            referenteClienteClienteId
          }
        }
      }''';

      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(document: graphQLDocument)
      );

      var response = await operation.response;
      var data = response.data;
      if (data == null) {
        print('errors: ${response.errors}');
        _referents = [];
      }
      Map<String, dynamic> extractedData = jsonDecode(data!);
      //print('Query result: ' + data!);

      List<referenteCliente?> referentsList =
      (extractedData['listReferenteClientes']['items'] as List)
          .map((item) => referenteCliente.fromJson(item))
          .toList();
      _referents = referentsList;
      //print('referenti $referents');
      notifyListeners();
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<int> createReferent(String email, Cliente customer) async {
    final model = referenteCliente(
        email: email,
        referenteClienteClienteId: customer.id,
        cliente: customer);
    safePrint(model);
    try {
      final request = ModelMutations.create(model);
      safePrint(request);
      final response = await Amplify.API.mutate(request: request).response;
      safePrint(response);

      final createdReferent = response.data;
      if (createdReferent == null) {
        safePrint('errors: ${response.errors}');
        return 0;
      }
      safePrint('Mutation result: referentID: ${createdReferent.id}');
    }catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    _referents.add(model);
    notifyListeners();
    return 200;
  }

  Future<int> deleteReferent(referenteCliente modelToDelete) async {
    try {
      final request = ModelMutations.delete(modelToDelete);
      final response = await Amplify.API.mutate(request: request).response;
      print('Response: $response');
    }catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    _referents.remove(modelToDelete);
    notifyListeners();
    return 200;
  }

}