import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html' as html;
import 'package:coownergeneration/core/util/responsive.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/models/property.dart';
import '../../../../core/services/properties-db-service.dart';
import '../../../../core/util/download_file.dart';

class DocumentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.1,
        ),
        SizedBox(
          height: screenHeight * 0.8,
          child: StreamBuilder(
              stream: PropertiesService.propertyRef.snapshots(),
              builder:
                  (context, AsyncSnapshot<QuerySnapshot> propertiesSnapshot) {
                if (propertiesSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final propertiesDocs = propertiesSnapshot.requireData.docs;
                return ListView.builder(
                    itemCount: propertiesDocs.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      Property item = propertiesDocs[index].data() as Property;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.name),
                          ),
                          ListView.builder(
                              itemCount: item.documents.length,
                              shrinkWrap: true,
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext ctx, int index) {
                                return Container(
                                    width: 600,
                                    child: Card(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.picture_as_pdf),
                                          Text(item
                                              .documents[index].documentName),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Expanded(
                                            child: Text(item
                                                .documents[index].createdAt
                                                .toString()),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                html.window.open(
                                                    item.documents[index]
                                                        .documentUrl,
                                                    "_blank");
                                              },
                                              icon: Icon(Icons.preview)),
                                          IconButton(
                                              onPressed: () async {
                                                await downloadFileWeb(
                                                    item.documents[index]
                                                        .documentUrl,
                                                    item.documents[index]
                                                        .documentName);
                                              },
                                              icon: Icon(Icons.download)),
                                        ],
                                      ),
                                    )));
                              }),
                        ],
                      );
                    });
              }),
        ),
      ],
    );
  }
}
