import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:immocrowd/ui/widgets/general/tabs/location-tab.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

import '../../core/models/property.dart';
import '../../core/util/design-constants.dart';
import '../widgets/general/photo-details-fullscreen.dart';
import '../widgets/general/tabs/investmant-case.dart';
import '../widgets/general/tabs/photos-tab.dart';

class PropertyDetailsScreen extends StatelessWidget {
  static const String routeName = "/details";

  /*Property selectedProperty = Property(
      id: "id",
      name: "name",
      shortDescription: "shortDescription",
      address: "address",
      photo: const [
        "https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/properties%2Fimages%2FDSC_0011-1024x553.jpg?alt=media&token=415f10c8-538d-4c4a-a359-1986a3edb2a5",
        "https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/properties%2Fimages%2Fproprietati-speciale-de-inchiriat-bucuresti-obor-127732816_620x465.jpg?alt=media&token=2682ec97-6c74-4f04-b082-ee342d9e3918"
      ],
      createdAt: Timestamp.now(),
      modifiedAt: Timestamp.now());
*/
  ListTab _buildListTab(String text, Icon icon) {
    return ListTab(
        label: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        icon: icon,
        activeBackgroundColor: Color(DesignConstants.GREEN),
        inactiveBackgroundColor: Colors.black12,
        borderRadius: BorderRadius.zero,
        borderColor: Colors.transparent,
        showIconOnList: false);
  }

  @override
  Widget build(BuildContext context) {
    final selectedProperty =
        ModalRoute.of(context)!.settings.arguments as Property;
    /*
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              snap: true,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
                ],
              ),
              bottom: TabBar(
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                  new Tab(
                      icon: new Icon(Icons.lightbulb_outline), text: "Tab 2"),
                ],
              ),
            ),
          ];
        },
        body: Center(
          child: Text("Sample text"),
        ),
      ),
    ));
  */

    //  final selectedProperty = ModalRoute.of(context)!.settings.arguments as Property;
    /*
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.call), text: "Call"),
                    Tab(icon: Icon(Icons.message), text: "Message"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Text("Call"),
              Text("Message"),
            ],
          ),
        ),
      ),
    );
  */

    //   final selectedProperty =
    //     ModalRoute.of(context)!.settings.arguments as Property;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProperty.name),
      ),
      body: ScrollableListTabView(
        tabHeight: 48,
        bodyAnimationDuration: const Duration(milliseconds: 150),
        tabAnimationCurve: Curves.easeOut,
        tabAnimationDuration: const Duration(milliseconds: 200),
        tabs: [
          ScrollableListTab(
              tab: _buildListTab('Photos', Icon(Icons.photo_album)),
              body: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                ),
                itemCount: selectedProperty.photo.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoFullScreen(
                              image: selectedProperty.photo[index],
                              name: selectedProperty.name),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(selectedProperty.photo[index]),
                        ),
                      ),
                    ),
                  );
                },
              )), //PhotosTab(property)),
          ScrollableListTab(
            tab: _buildListTab('Investment case', Icon(Icons.analytics)),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 4),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (_, index) => FittedBox(
                  fit: BoxFit.contain, child: Card(child: InvestmantCase())),
            ),
          ),
          ScrollableListTab(
              tab: _buildListTab('Location', Icon(Icons.map)),
              body: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (_, index) =>
                    Card(child: LocationTab(selectedProperty)),
              )),
          ScrollableListTab(
              tab: _buildListTab('Documents', Icon(Icons.cases)),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, index) => ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    alignment: Alignment.center,
                    child: Icon(Icons.picture_as_pdf),
                  ),
                  title: Text('Document number $index'),
                ),
              )),
          ScrollableListTab(
              tab: _buildListTab('Update', Icon(Icons.update)),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (_, index) => ListTile(
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      alignment: Alignment.center,
                      child: index % 2 == 0
                          ? Icon(Icons.request_page)
                          : Icon(Icons.document_scanner)),
                  title: Text('Update number $index'),
                ),
              )),
        ],
      ),
    );
  }
}
