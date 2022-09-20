import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class Property {
  static String COLLECTION_NAME = 'properties';

  Property({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.address,
    required this.photo,
    required this.createdAt,
    required this.modifiedAt,
    required this.price,
  });

  final String id;
  final String name;
  final String shortDescription;
  final String address;
  final List<String> photo;
  final String price;

  Timestamp createdAt = Timestamp.now();
  Timestamp modifiedAt = Timestamp.now();

  Timestamp get created => createdAt;
  Timestamp get modified => createdAt;

  Property.updateId(String id, Property other)
      : this(
            id: id,
            name: other.name,
            shortDescription: other.shortDescription,
            address: other.address,
            photo: List<String>.from(other.photo),
            createdAt: other.createdAt,
            modifiedAt: Timestamp.now(),
            price: other.price);

  Property.updateName(String name, Property other)
      : this(
            id: other.id,
            name: name,
            shortDescription: other.shortDescription,
            address: other.address,
            photo: List<String>.from(other.photo),
            createdAt: other.createdAt,
            modifiedAt: Timestamp.now(),
            price: other.price);
  Property.updateShortDescription(String shortDescription, Property other)
      : this(
            id: other.id,
            name: other.name,
            shortDescription: shortDescription,
            address: other.address,
            photo: List<String>.from(other.photo),
            createdAt: other.createdAt,
            modifiedAt: Timestamp.now(),
            price: other.price);
  Property.updateAddress(String address, Property other)
      : this(
            id: other.id,
            name: other.name,
            shortDescription: other.shortDescription,
            address: address,
            photo: List<String>.from(other.photo),
            createdAt: other.createdAt,
            modifiedAt: Timestamp.now(),
            price: other.price);
  Property.updatePhoto(List<String> photo, Property other)
      : this(
            id: other.id,
            name: other.name,
            shortDescription: other.shortDescription,
            address: other.address,
            photo: List<String>.from(photo),
            createdAt: other.createdAt,
            modifiedAt: Timestamp.now(),
            price: other.price);

  Property.fromJson(Map<String, Object?> json)
      : this(
            id: json['id'] as String,
            name: json['name']! as String,
            shortDescription: json['shortDescription']! as String,
            address: json['address']! as String,
            photo: (json['photo']! as List).cast<String>(),
            createdAt: json['createdAt'] as Timestamp,
            modifiedAt: json['modifiedAt'] as Timestamp,
            price: json['price'] as String);

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'shortDescription': shortDescription,
      'address': address,
      'photo': photo,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
      'price': price,
    };
  }
}
