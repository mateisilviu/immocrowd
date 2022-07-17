import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../interfaces/residence-interface.dart';
import '../models/residence.dart';
import '../util/app-constants.dart';

final residenceService = Provider(
  create: (BuildContext context) {
    return ResidenceService();
  },
);

class ResidenceService implements ResidenceDao {
  Future<List<Residence>> getResidences() async {
    try {
      final url = Uri.https(AppConstants.DB_URL, Residence.DB_Table);
      var response = await http.get(url);
      final List<Residence> loadedProperties = [];
      if (response.statusCode == 200) {
        var jsonResponseList =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        jsonResponseList.forEach((residenceId, residenceModel) {
          loadedProperties.add(Residence.fromJson(residenceId, residenceModel));
        });
      }
      return loadedProperties;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> addResidence(Residence residence) async {
    final url = Uri.https(AppConstants.DB_URL, Residence.DB_Table);
    try {
      final response = await http.post(url, body: Residence.toJson(residence));
      //print(response);
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        return Future.value(convert.json.decode(response.body)['name']);
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        print(response.body);
        throw Exception(response.statusCode);
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
