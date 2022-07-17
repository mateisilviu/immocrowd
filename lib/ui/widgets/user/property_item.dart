import 'package:flutter/material.dart';
import 'package:immocrowd/core/models/residence.dart';
import 'package:provider/provider.dart';

import '../../screens/property_detail_screen.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final residence = Provider.of<Residence>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              PropertyDetailScreen.routeName,
              arguments: residence.id,
            );
          },
          child: Image.network(
            residence.photo,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Residence>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ),
          title: Text(
            residence.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
