import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardMainWidget extends StatelessWidget {
  const DashboardMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'User\'s Dashboard',
            textScaleFactor: 2.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildCardsRow(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Investments',
            textScaleFactor: 2.0,
          ),
        ),
        _buildTableInvestments()
      ]),
    );
  }

  Table _buildTableInvestments() {
    return Table(
      border: TableBorder.all(),
      children: [
        buildRow([
          'ID',
          'Property Name',
          'Property price',
          'Amount invested',
          'Price per share',
          'Shared purchesd',
          'Ownership percentage',
          'Dividents received'
        ], isHeader: true),
        buildRow([
          'ex-100',
          'Fantastic 1-Bedroom in 8 Boulevard Walk, Downtown',
          '1912339',
          '4999',
          '1.023',
          '5500',
          '0.43%',
          '78.9'
        ]),
        buildRow([
          'ex-101',
          'Fantastic 1-Bedroom in 8 Boulevard Walk, Downtown',
          '1912339',
          '4999',
          '1.023',
          '5500',
          '0.43%',
          '78.9'
        ]),
      ],
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
          );

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cell, style: style)),
          );
        }).toList(),
      );

  Widget _buildCardsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCard(context, "Wallet balance", "500 RON", Icons.wallet),
        _buildCard(context, "Total invested", "9000 RON", Icons.pie_chart),
        _buildCard(context, "Dividents received", "233 RON", Icons.auto_graph),
      ],
    );
  }

  Widget _buildCard(
      BuildContext context, String title, String subtitle, IconData icon) {
    return Container(
        width: 250,
        height: 70,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        textScaleFactor: 1.3,
                      ),
                      Text(subtitle)
                    ],
                  )
                ]),
          ),
        ));
  }
}
