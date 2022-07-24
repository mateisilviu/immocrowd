import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/property.dart';

abstract class PropertyDao {
  Future<QuerySnapshot<Map<String, dynamic>>> getProperties();
  Future<DocumentReference<Map<String, dynamic>>> addProperty(
      Property property);
}
