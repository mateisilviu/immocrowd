import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/models/residence.dart';

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
          return Container();
        },
      ),
    );
  }
}
