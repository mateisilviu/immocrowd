import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'dart:convert';

import './widgets/admin/insert_residence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr =
      await rootBundle.loadString('assets/theme/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Immo Equity Fund',
      theme: theme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immo Equity Fund'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_box_rounded),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.details),
            onPressed: () => {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            InsertResidence(),
          ],
        ),
      ),
    );
  }
}
