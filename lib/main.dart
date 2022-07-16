import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immocrowd/core/providers/residence-provider.dart';
import 'package:provider/provider.dart';
import 'package:json_theme/json_theme.dart';

import 'dart:convert';

import 'ui/screens/manage_properties.dart';
import 'ui/widgets/admin/insert_residence.dart';

//import './widgets/admin/insert_residence.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ResidenceProvider>(
            create: (_) => ResidenceProvider(),
          )
        ],
        child: MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              //: : Colors.deepOrange,
            ),
            home: ManagePropertiesScreen()));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMMO Equity Fund'),
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
