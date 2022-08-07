import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InvestmantCaseTable extends StatelessWidget {
  const InvestmantCaseTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
            label: Text('Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Assestmants',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Points',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Capital senior to Coowner')),
          DataCell(Text('0%')),
          DataCell(Text('1')),
        ]),
        DataRow(cells: [
          DataCell(Text('Location')),
          DataCell(Text('City Central')),
          DataCell(Text('5')),
        ]),
        DataRow(cells: [
          DataCell(Text('Rented')),
          DataCell(Text('Yes')),
          DataCell(Text('5')),
        ]),
        DataRow(cells: [
          DataCell(Text(
            'Total:',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            'Risk 4/10',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            '11',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ]),
      ],
    );
  }
}
