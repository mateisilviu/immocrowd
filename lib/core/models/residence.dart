import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class Residence with ChangeNotifier {
  static const DB_Table = 'residences.json';

  Residence({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.address,
    required this.photo,
  });

  static updateId(String newId, Residence other) {
    return Residence(
        id: newId,
        address: other.address,
        name: other.name,
        photo: other.photo,
        shortDescription: other.shortDescription);
  }

  static updateName(String newName, Residence other) {
    return Residence(
        id: other.id,
        name: newName,
        address: other.address,
        shortDescription: other.shortDescription,
        photo: other.photo);
  }

  static updateShortDescription(String newShortDescription, Residence other) {
    return Residence(
        id: other.id,
        name: other.name,
        shortDescription: newShortDescription,
        address: other.address,
        photo: other.photo);
  }

  static updateAddress(String newAddress, Residence other) {
    return Residence(
        id: other.id,
        name: other.name,
        shortDescription: other.shortDescription,
        address: newAddress,
        photo: other.photo);
  }

  static updatePhoto(String newPhoto, Residence other) {
    return Residence(
        id: other.id,
        name: other.name,
        shortDescription: other.shortDescription,
        address: other.address,
        photo: newPhoto);
  }

  final String id;
  final String name;
  final String shortDescription;
  final String address;
  final String photo;

  @override
  String toString() => '$name (id=$id)';

  static Residence fromJson(String id, Map<String, dynamic> json) {
    String _name = json['name'];
    String _shortDescription = json['shortDescription'];
    String _address = json['address'];
    String _photo = json['photo'];
    return Residence(
        id: id,
        name: _name,
        shortDescription: _shortDescription,
        address: _address,
        photo: _photo);
  }

  static String toJson(Residence residence) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = residence.name;
    data['shortDescription'] = residence.shortDescription;
    data['address'] = residence.address;
    data['photo'] = residence.photo;
    return convert.jsonEncode(data);
  }
}

/*
class Apartment extends Residence {
  const Apartment({id, name, shortDescription, address, photo})
      : super(
            id: id,
            name: name,
            shortDescription: shortDescription,
            address: address,
            photo: photo);

  @override
  fromJson(Map<String, dynamic> json) {
    var _id = json['id'];
    String _name = json['name'];
    String _shortDescription = json['shortDescription'];
    String _address = json['address'];
    String _photo = json['photo'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortDescription'] = this.shortDescription;
    data['address'] = this.address;
    data['photo'] = this.photo;
    return data;
  }
  
}
*/