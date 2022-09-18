import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'investmant-case-table.dart';

class InvestmantCase extends StatelessWidget {
  const InvestmantCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        child: Column(
          children: [
            Row(children: const [
              FittedBox(
                  child: Text(
                      "The project will be acquired by our SPV, which is registered in Spain and owned 100% by Reinvest Holding OÜ. Currently the property is already reserved by our SPV. The unfinished building will come at ~800 EUR per sq, which is well below the market.")),
            ]),
            Row(children: const [
              FittedBox(
                  child: Text(
                      "Performing the renovation on these buildings will provide over 28% of profit margin before taxes. The SPV has 2 local employees who will be managing the project from Reinvest24 side, including the sales process and monitoring the renovation works.")),
            ]),
            Row(children: [
              const Text(
                "Risk rating",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ]),
            InvestmantCaseTable(),
            //SelectionLineHighlight.withSampleData()
          ],
        ),
      ),
    );
  }
}
