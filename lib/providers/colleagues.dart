/**
    A provider class that allows to perform CRUD operations on the colleagues,
    corresponding to the Collega entity, and notifies the interested widgets of any state changes.
 **/

import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../models/Collega.dart';
class Colleagues with ChangeNotifier {
  List<Collega?> _colleagues = [];

  List<Collega?> get colleagues {
    return [..._colleagues];
  }

  bool isEmpty() {
    return _colleagues.isEmpty;
  }

  bool exists(String? id){
    if(id==null) return false;
    try{
      Collega? c = _colleagues.firstWhere((colleague) => colleague?.id == id);
      return c!= null ? true : false;
    }catch(Exception){return false;}
  }

  Future<void> fetchAndSetColleagues() async {
    try {
      String graphQLDocument = '''query listCollegas {
      listCollegas {
        items {
          cognome
          email
          id
          nome
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
        _colleagues = [];
      }
      Map<String, dynamic> extractedData = jsonDecode(data!);
      //print('Query result: ' + data!);

      List<Collega?> colleaguesList =
      (extractedData['listCollegas']['items'] as List)
          .map((item) => Collega.fromJson(item))
          .toList();
      _colleagues = colleaguesList;
      //print('colleghi $colleagues');
      notifyListeners();
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }


  Future<List<Collega?>> queryListColleghi() async {
    try {
      final request = ModelQueries.list(Collega.classType);
      final response = await Amplify.API.query(request: request).response;

      final colleghi = response.data?.items;
      if (colleghi == null) {
        print('errors: ${response.errors}');
        return <Collega?>[];
      }
      print(response.data?.items);
      return colleghi;
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
    return <Collega?>[];
  }

  Future<void> createCollega() async {
    try {
      final collega = Collega(nome: 'stefano');
      final request = ModelMutations.create(collega);
      final response = await Amplify.API.mutate(request: request).response;

      final createdCollega = response.data;
      if (createdCollega == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result: ${createdCollega.nome}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Collega? findById(String? id) {
    if(!exists(id)) return null;
      return _colleagues.firstWhere((c) => c?.id == id);
  }
}