import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/models/property.dart';
import '../../../core/util/responsive.dart';
import '../../screens/property_detail_screen.dart';
import '../../screens/property_details_screen.dart';

class PropertyItem extends StatelessWidget {
  PropertyItem(this.item);
  final Property item;

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var padding = ResponsiveWidget.isLargeScreen(context) ? 10.0 : 5.0;
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(viewportFraction: 1.0, autoPlay: true),
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
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(padding),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(padding),
                  child: Text(
                    item.shortDescription,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: EdgeInsets.all(padding),
                child: ElevatedButton(
                    onPressed: () async => {
                          await showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Thank you for your interest!'),
                              actions: <Widget>[
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your email',
                                        )),
                                    Padding(
                                        padding: EdgeInsets.all(10),
                                        child: ElevatedButton(
                                            onPressed: () => {
                                                  FirebaseFirestore.instance
                                                      .collection('new-clients')
                                                      .add({
                                                    'email': emailController
                                                        .value.text
                                                  }),
                                                  Navigator.of(ctx).pop()
                                                },
                                            child: const Text(
                                                'Email me when this is ready.'))),
                                  ],
                                )
                              ],
                            ),
                          )
                        },
                    child: const Text('Invest'))),
            Padding(
                padding: EdgeInsets.all(padding),
                child: ElevatedButton(
                    onPressed: () => {
                          // Navigator.of(context).pushNamed(
                          //     PropertyDetailScreen.routeName,
                          //     arguments: item)
                          Navigator.pushNamed(
                              context, PropertyDetailsScreen.routeName,
                              arguments: item)
                        },
                    child: const Text('Details'))),

            // IconButton(onPressed: () => {}, icon: Icon(Icons.monetization_on))
          ])
        ],
      ),
    );
  }
}
