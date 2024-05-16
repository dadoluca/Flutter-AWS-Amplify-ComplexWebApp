/**
    A provider class that allows to perform CRUD operations on the customers,
    corresponding to the Cliente entity, and notifies the interested widgets of any state changes.
 **/

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../models/Cliente.dart';

class Customers with ChangeNotifier {
  List<Cliente?> _customers = [];
  late Map<String, Color> _colorMap = {};
  bool _alreadyFetch = false;

  List<Cliente?> get customers {
    return [..._customers];
  }

  bool isEmpty() {
    return _customers.isEmpty;
  }

  Cliente? findById(String? id) {
    if(!exists(id)) return null;
      return _customers.firstWhere((customer) => customer?.id == id);
  }

  bool exists(String? id){
    if(id==null) return false;
    try{
      Cliente? c = _customers.firstWhere((customer) => customer?.id == id);
      return c!= null ? true : false;
    }catch(Exception){return false;}
  }

  Future<void> fetchAndSetCustomers() async {
    if (_alreadyFetch) return;
    //if(_customer.length>0) return;
    try {
      final request = ModelQueries.list(Cliente.classType);
      final response = await Amplify.API.query(request: request).response;

      final clienti = response.data?.items;
      if (clienti == null) {
        print('errors: ${response.errors}');
      }
      //print(response.data?.items);
      _alreadyFetch = true;
      _customers = clienti!;
      _colorMap = {};
      _colorMap = _createColorMap(_customers);
      notifyListeners();
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<int> createCustomer(String name, Color color) async {
    try {
      final model = Cliente(nome: name, colore: color.toString());
      final request = ModelMutations.create(model);
      final response = await Amplify.API.mutate(request: request).response;

      final createdCustomer = response.data;
      if (createdCustomer == null) {
        safePrint('errors: ${response.errors}');
        return 0;
      }
      safePrint('Mutation result: customerID: ${createdCustomer.id}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
    _alreadyFetch = false;
    await fetchAndSetCustomers();
    return 200;
  }

  Future<int> deleteCustomer(Cliente modelToDelete) async {
    try {
      final request = ModelMutations.delete(modelToDelete);
      final response = await Amplify.API.mutate(request: request).response;
      print('Response: $response');
    }catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    _customers.remove(modelToDelete);
    notifyListeners();
    return 200;
  }

  Future<int> updateCustomer(Cliente originalCustomer, String newName, Color newColor) async {
    try{
      final updatedModel = originalCustomer.copyWith(
          nome: newName,
          colore: newColor.toString());

      final request = ModelMutations.update(updatedModel);
      final response = await Amplify.API.mutate(request: request).response;
      print('Response: $response');
      if (updatedModel == null) {
        safePrint('errors: ${response?.errors}');
        return 0;
      }
      safePrint('Mutation result: $updatedModel');
    }catch (e) {
      safePrint('Mutation failed: $e');
      return 0;
    }
    _alreadyFetch = false;
    fetchAndSetCustomers();
    return 200;
  }

  Color getColor(String? customerId) {
    if(customerId == null) return Colors.grey;
    try {
      Cliente? c = findById(customerId);
      if (c != null && c?.colore != null && c?.colore != 'Color(0xff000000)') {
        String? hexString = c?.colore?.substring(
            8, (c?.colore?.length ?? 0) - 1); // prendi solo "ffcc3838"
        Color color = Color(int.parse(
            "0x$hexString")); // aggiungi "0x" prima del valore esadecimale
        //print('colore cliente: $color');
        return color;
      } else if (_colorMap.containsKey(customerId)) {
        return _colorMap[customerId]!;
      } else {
        // se non c'è nessun colore associato all'id di progetto, restituisci un colore di default
        return Colors.grey;
      }
    } catch (e) {}
    return Colors.black;
  }

  Map<String, Color> _createColorMap(List<Cliente?> clienti) {
    final Map<String, Color> colorMap = {};
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      // Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Color.fromARGB(255, 255, 114, 161),
      //  Colors.teal,
      //  Colors.lime,
      Color.fromARGB(255, 14, 227, 255),
      //Colors.amber,
      Colors.indigo,
      Colors.brown,
//    Colors.grey,
    ];
    List<Color> availableColors = List.from(colors);

    clienti.forEach((cliente) {
      if (cliente == null) {
        return;
      }
      if (availableColors.length == 0) {
        availableColors = List.from(colors);
      }
      final randomIndex = Random().nextInt(availableColors.length);
      final randomColor = availableColors[randomIndex];
      //print('${cliente.id} $randomColor');
      colorMap[cliente.id] = randomColor;

      availableColors.removeAt(randomIndex);
    });

    return colorMap;
  }

}
