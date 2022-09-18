import 'package:flutter/material.dart';

import '../../core/models/property.dart';
import '../../core/models/property/investmant-case.dart';
import '../../core/util/responsive.dart';
import '../widgets/general/tabs/location-tab.dart';
import '../widgets/general/tabs/photos-tab.dart';

class PropertyDetailScreen extends StatefulWidget {
  static const routeName = '/property-detail';

  PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen>
    with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedProperty =
        ModalRoute.of(context)!.settings.arguments as Property;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProperty.name),
      ),
      body: DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              bottom: TabBar(
                controller: _controller,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: Colors.white), //Change background color from here
                automaticIndicatorColorAdjustment: true,
                tabs: [
                  Tab(
                      icon: Icon(Icons.details),
                      child: Text(
                        'Details',
                        style: ResponsiveWidget.calculateTextStyle(context),
                      )),
                  Tab(
                      icon: Icon(Icons.photo_album),
                      child: Text('Photos',
                          style: ResponsiveWidget.calculateTextStyle(context))),
                  Tab(
                      icon: Icon(Icons.map),
                      child: Text('Location',
                          style: ResponsiveWidget.calculateTextStyle(context))),
                  Tab(
                      icon: Icon(Icons.analytics),
                      child: Text('Investment case',
                          style: ResponsiveWidget.calculateTextStyle(context))),
                  Tab(
                      icon: Icon(Icons.cases),
                      child: Text('Documents',
                          style: ResponsiveWidget.calculateTextStyle(context))),
                  Tab(
                      icon: Icon(Icons.update),
                      child: Text('Updates',
                          style: ResponsiveWidget.calculateTextStyle(context))),
                ],
              ),
              //  title: const Text('Tabs Demo'),
            ),
            body: GestureDetector(
              onPanUpdate: (details) => {
                // Swiping in right direction.
                /*
                if (details.delta.dx > 0)
                  {_controller.animateTo(_selectedIndex += 1)},
                // Swiping in left direction.
                if (details.delta.dx < 0)
                  {_controller.animateTo(_selectedIndex -= 1)}*/
              },
              child: TabBarView(
                controller: _controller,
                children: [
                  Text("Details"),
                  PhotosTab(selectedProperty),
                  LocationTab(selectedProperty),
                  // InvestmantCase(),
                  Text("Documents"),
                  Text("Updates"),
                ],
              ),
            )),
      ),
    );
  }
}
