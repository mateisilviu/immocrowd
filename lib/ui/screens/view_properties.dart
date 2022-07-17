import 'package:flutter/material.dart';
import 'package:immocrowd/core/providers/residence-provider.dart';
import 'package:provider/provider.dart';

import '../widgets/user/app_drawer.dart';
import '../widgets/user/property_grid.dart';

class ViewPropertiesScreen extends StatefulWidget {
  const ViewPropertiesScreen({Key? key}) : super(key: key);

  @override
  State<ViewPropertiesScreen> createState() => _ViewPropertiesScreenState();
}

class _ViewPropertiesScreenState extends State<ViewPropertiesScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ResidenceProvider>(context).getResidences().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyShop'), actions: <Widget>[]),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PropertyGrid(),
    );
  }
}
