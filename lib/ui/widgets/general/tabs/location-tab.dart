import 'package:flutter/material.dart' as material;
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';

import '../../../../core/models/property.dart';
import 'chart-example.dart';

class LocationTab extends material.StatelessWidget {
  LocationTab(this.selectedProperty);

  Property selectedProperty;

  @override
  material.Widget build(material.BuildContext context) {
    var halfScreenSize = material.MediaQuery.of(context).size.width / 2;
    var height = material.MediaQuery.of(context).size.height;
    return material.Row(
      // mainAxisAlignment: material.MainAxisAlignment.center,
      children: [
        material.SizedBox(
            height: height,
            width: halfScreenSize,
            child: material.Container(
                child: getMap(height, halfScreenSize, selectedProperty))),
        material.VerticalDivider(
          width: 1.0,
        ),
        material.Column(
          children: [
            material.Padding(
              padding: material.EdgeInsets.all(20),
              child: material.Text("Location:"),
            ),
            material.SizedBox(
                height: halfScreenSize / 2,
                width: halfScreenSize / 2,
                child: SelectionLineHighlight.withSampleData()),
          ],
        )
      ],
    );
  }
}

material.Widget getMap(double height, double width, Property selectedProperty) {
  //A unique id to name the div element
  String htmlId = "6";
  //creates a webview in dart
  //ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = LatLng(44.43192426937448, 26.026288896255853);
    //class to create a div element

    final mapOptions = MapOptions()
      ..zoom = 11
      ..tilt = 90
      ..center = latLang;
    final elem = DivElement()
      ..id = htmlId
      ..style.width = "${width}"
      ..style.height = "${height}"
      ..style.border = "none";

    final map = GMap(elem, mapOptions);
    Marker(MarkerOptions()
      ..position = latLang
      ..map = map
      ..title = 'My position');
    Marker(MarkerOptions()
      ..position = LatLng(44.43205068027913, 26.02643373497814)
      ..map = map
      ..title = 'My position');
    return elem;
  });
  //creates a platform view for Flutter Web
  return material.HtmlElementView(
    viewType: htmlId,
  );
}
