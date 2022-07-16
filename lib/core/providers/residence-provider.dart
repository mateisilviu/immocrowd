import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:immocrowd/core/models/residence.dart';
import 'package:immocrowd/core/services/residence-service.dart';

import '../interfaces/residence-interface.dart';

class ResidenceProvider with ChangeNotifier {
  //implements ResidenceDao {
  final _residenceService = ResidenceService();

  List<Residence> _residenceInMemory = [];

  List<Residence> get residenceInMemory {
    return [..._residenceInMemory];
  }

  Future<void> getResidences() async {
    try {
      _residenceInMemory = await _residenceService.getResidences();
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addResidence(Residence residence) async {
    try {
      var newId = await _residenceService.addResidence(residence);
      var newResidence = Residence.updateId(newId, residence);
      _residenceInMemory.add(newResidence);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
