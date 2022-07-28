import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/app-constants.dart';

import '../../../core/models/property.dart';
import '../../../core/services/properties-db-service.dart';
import '../../../core/util/responsive.dart';
import 'property_item.dart';

class PropertyGrid extends StatelessWidget {
  const PropertyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsivePadding = ResponsiveWidget.isSmallScreen(context)
        ? AppConstants.VIEW_PROPERTIES_GRID_PADDING / 5
        : ResponsiveWidget.isMediumScreen(context)
            ? AppConstants.VIEW_PROPERTIES_GRID_PADDING / 2
            : AppConstants.VIEW_PROPERTIES_GRID_PADDING;
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
            padding: EdgeInsets.all(responsivePadding),
            itemCount: propertiesDocs.length,
            itemBuilder: (ctx, i) =>
                PropertyItem(propertiesDocs[i].data() as Property),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: responsivePadding / 5,
              mainAxisSpacing: responsivePadding / 5,
            ),
          );
        });
  }
}
