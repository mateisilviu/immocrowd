import 'package:flutter/material.dart'; // as material;
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as gmaps;

import '../../../../core/models/property.dart';
import 'chart-example.dart';

class LocationTab extends StatelessWidget {
  LocationTab(this.selectedProperty);

  Property selectedProperty;

  @override
  Widget build(BuildContext context) {
    var halfScreenSize = MediaQuery.of(context).size.width / 2;
    var height = MediaQuery.of(context).size.height;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: height,
            width: halfScreenSize,
            child: Container(
                child: getMap(height, halfScreenSize, selectedProperty))),
        VerticalDivider(
          width: 1.0,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Location:"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Average price in region:"),
            ),
            SizedBox(
                height: halfScreenSize / 2,
                width: halfScreenSize / 2,
                child: SelectionLineHighlight.withSampleData()),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Average price in region:"),
            ),
          ],
        )
      ],
    );
  }
}

Widget getMap(double height, double width, Property selectedProperty) {
  //A unique id to name the div element
  String htmlId = "6";
  //creates a webview in dart
  //ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = gmaps.LatLng(44.43192426937448, 26.026288896255853);
    //class to create a div element

    final mapOptions = gmaps.MapOptions()
      ..zoom = 16
      ..tilt = 90
      ..center = latLang;
    final elem = DivElement()
      ..id = htmlId
      ..style.width = "${width}"
      ..style.height = "${height}"
      ..style.border = "none";

    final map = gmaps.GMap(elem, mapOptions);
    gmaps.Marker(gmaps.MarkerOptions()
      ..position = latLang
      ..map = map
      ..title = 'My position');
    gmaps.Marker(gmaps.MarkerOptions()
      ..position = gmaps.LatLng(44.43205068027913, 26.02643373497814)
      ..map = map
      ..title = 'My position');
    return elem;
  });
  //creates a platform view for Flutter Web
  return HtmlElementView(
    viewType: htmlId,
  );
}
