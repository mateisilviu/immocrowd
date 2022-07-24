import 'package:cloud_firestore/cloud_firestore.dart';

import '../interfaces/property-service-interface.dart';
import '../models/property.dart';

class PropertiesService implements PropertyDao {
  final FirebaseFirestore dbInstance = FirebaseFirestore.instance;

  static final propertyRef = FirebaseFirestore.instance
      .collection(Property.COLLECTION_NAME)
      .orderBy(
        'createdAt',
        descending: true,
      )
      .withConverter<Property>(
          fromFirestore: (snapshots, _) => Property.fromJson(snapshots.data()!),
          toFirestore: (toFirestore, _) => toFirestore.toJson());

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getProperties() async {
    try {
      return dbInstance
          .collection(Property.COLLECTION_NAME)
          .orderBy(
            'createdAt',
            descending: true,
          )
          .limit(10)
          .get();
    } catch (e) {
      rethrow;
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>>
      getPropertiesSnapshot() async {
    try {
      return dbInstance
          .collection(Property.COLLECTION_NAME)
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> addProperty(
      Property property) async {
    try {
      return dbInstance
          .collection(Property.COLLECTION_NAME)
          .add(property.toJson());
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProperty(Property property) async {
    try {
      dbInstance
          .collection(Property.COLLECTION_NAME)
          .doc(property.id)
          .set(property.toJson());
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
