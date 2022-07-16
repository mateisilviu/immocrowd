import 'package:flutter/material.dart';

import '../../../core/models/residence.dart';
import './new_residence.dart';
import '../user/residence_list.dart';

class InsertResidence extends StatefulWidget {
  @override
  _InsertResidenceState createState() => _InsertResidenceState();
}

class _InsertResidenceState extends State<InsertResidence> {
  final List<Residence> _availableResidence = [
    Residence(
        id: "1",
        name: '1-Bedroom in Dream Towers, Dubai Marina',
        address: 'Dream Tower 1, Sheikh Zayed Rd - Dubai Marina - Dubai',
        photo: '1.jpeg',
        shortDescription: 'About Dream Towers'),
    Residence(
        id: "2",
        name: 'Burj Khalifa View 1-Bed in Downtown Dubai',
        address: 'Dream Tower 1, Sheikh Zayed Rd - Dubai Marina - Dubai',
        photo: '2.jpeg',
        shortDescription: 'About Bellevue Towers'),
  ];

  void _addNewApartment(
      String name, String address, String photo, String shortDescription) {
    final newAp = Residence(
        id: "5",
        name: name,
        address: address,
        photo: photo,
        shortDescription: shortDescription);

    setState(() {
      _availableResidence.add(newAp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewResidence(_addNewApartment),
        ResidenceList(_availableResidence),
      ],
    );
  }
}
