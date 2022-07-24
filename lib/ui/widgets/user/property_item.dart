import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/models/property.dart';
import '../../screens/property_detail_screen.dart';

class PropertyItem extends StatelessWidget {
  PropertyItem(this.item);
  final Property item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(),
            items: item.photo
                .map((item) => Container(
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
          ),
          /*   Stack(
            children: <Widget>[

              
              Container(
                height: 400,
                width: 400,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: 
                    fit: BoxFit.fill,
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Live',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.green,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(4, 4)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 20),
                padding: EdgeInsets.all(5),
                child: Text(
                  '29 days',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.green,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(4, 4)),
                  ],
                ),
              )
            ],
          ),*/
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                item.shortDescription,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(children: [
            OutlinedButton(onPressed: () => {}, child: const Text('Details')),
            IconButton(onPressed: () => {}, icon: Icon(Icons.monetization_on))
          ])
        ],
      ),
    );
  }
}
