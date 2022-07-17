import 'package:flutter/material.dart';
import 'package:immocrowd/core/providers/residence-provider.dart';
import 'package:provider/provider.dart';

import 'property_item.dart';

class PropertyGrid extends StatelessWidget {
  const PropertyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final properties =
        Provider.of<ResidenceProvider>(context).residenceInMemory;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: properties.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: properties[i],
        child: PropertyItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
