import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/property.dart';
import '../services/properties-db-service.dart';

class PropertiesProvider with ChangeNotifier {
  //implements ResidenceDao {
  final _propertiesService = PropertiesService();

  List<Property> _propertiesInMemory = [];

  List<Property> get properties {
    return [..._propertiesInMemory];
  }

  // Future<void> getResidences() async {
  //   try {
  //     _propertiesInMemory = await _propertiesService.getProperties().asStream().forEach( (element ) =>
  //       {_propertiesInMemory.add(element.);}
  //     );
  //     notifyListeners();
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  // getResidences() async {
  //   var properties = await _propertiesService.getProperties();
  //   properties.docs.forEach((element) {
  //     _propertiesInMemory.add(Property.fromJson(element));
  //   })
  // }

  Future<Property> addProperty(Property residence) async {
    try {
      var newDocRef = await _propertiesService.addProperty(residence);
      var newResidence = Property.updateId(newDocRef.id, residence);
      _propertiesInMemory.add(newResidence);
      notifyListeners();
      return newResidence;
    } catch (error) {
      throw (error);
    }
  }

  Future<Property> updateProperty(Property residence) async {
    try {
      _propertiesService.updateProperty(residence);
      notifyListeners();
      return residence;
    } catch (error) {
      throw (error);
    }
  }
}
