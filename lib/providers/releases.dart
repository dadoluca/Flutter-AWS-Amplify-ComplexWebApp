/**
    A provider class that allows to perform CRUD operations on the releases,
    corresponding to the Release entity, and notifies the interested widgets of any state changes.
 **/

import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import '../models/Cliente.dart';
import '../models/Release.dart';

class Releases with ChangeNotifier {
  List<Release?> _releases = [];

  List<Release?> get releases {
    return [..._releases];
  }

  bool isEmpty() {
    return _releases.isEmpty;
  }

  Release? findById(String? id) {
    if(!exists(id)) return null;
    return _releases.firstWhere((release) => release?.id == id,);
  }
  bool exists(String? id){
    if(id==null) return false;
    try{
      Release? c = _releases.firstWhere((release) => release?.id == id);
      return c!= null ? true : false;
    }catch(Exception){return false;}
  }

  Future<void> fetchAndSetReleases([String customerId = '']) async {
    try {
      String filter = (customerId == '')
          ? ''
          : '(filter: {releaseClienteId: {eq: "$customerId"}})';

      String graphQLDocument = '''query listReleases {
      listReleases$filter  {
    items {
     data
      id
      titolo
      releaseClienteId
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
        _releases = [];
      }
      Map<String, dynamic> extractedData = jsonDecode(data!);

      List<Release?> releasesList =
      (extractedData['listReleases']['items'] as List)
          .map((item) => Release.fromJson(item))
          .toList();

      _releases = releasesList;
      notifyListeners();

    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<int> createRelease(String name, DateTime date, Cliente customer) async {
    final model = Release(
        titolo: name,
        data: TemporalDate(date),
        releaseClienteId: customer.id,
        cliente: customer);
    try {
      final request = ModelMutations.create(model);
      final response = await Amplify.API.mutate(request: request).response;

      final createdRelease = response.data;
      if (createdRelease == null) {
        safePrint('errors: ${response.errors}');
        return 0;
      }
      safePrint('Mutation result: releaseID: ${createdRelease.id}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    finally{
      _releases.add(model);
      notifyListeners();
    }
    return 200;
  }

  Future<int> deleteRelease(Release modelToDelete) async {
    try {
      final request = ModelMutations.delete(modelToDelete);
      final response = await Amplify.API.mutate(request: request).response;
      print('Response: $response');
    }catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    _releases.remove(modelToDelete);
    notifyListeners();
    return 200;
  }


}