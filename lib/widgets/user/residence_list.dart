import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/residence.dart';

class ResidenceList extends StatelessWidget {
  final List<Residence> availableResidences;

  ResidenceList(this.availableResidences);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: GridView.builder(
        itemCount: availableResidences.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 700,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20),
        itemBuilder: (ctx, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Stack(
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
                          image: AssetImage(
                              'assets/images/${availableResidences[index].photo}'),
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
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      availableResidences[index].name,
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
                      availableResidences[index].shortDescription,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
