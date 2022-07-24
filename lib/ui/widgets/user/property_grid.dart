import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/models/property.dart';
import '../../../core/services/properties-db-service.dart';
import 'property_item.dart';

class PropertyGrid extends StatelessWidget {
  const PropertyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: PropertiesService.propertyRef.snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> propertiesSnapshot) {
          if (propertiesSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final propertiesDocs = propertiesSnapshot.requireData.docs;
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: propertiesDocs.length,
            itemBuilder: (ctx, i) =>
                PropertyItem(propertiesDocs[i].data() as Property),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
        });
  }
}
