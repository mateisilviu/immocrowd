import 'package:coownergeneration/ui/screens/dashboard/pages/profile_widget.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/general/header.dart';
import 'pages/dashboard_main_widget.dart';
import 'pages/documents_widget.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';

  final bool openSettings;

  DashboardScreen({this.openSettings = false});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController page;

  @override
  void dispose() {
    page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedPage;
    setState(() {
      selectedPage = widget.openSettings == true ? 3 : 0;
    });
    page = PageController(initialPage: selectedPage);
    return Scaffold(
        appBar: HeaderWidget(),
        body: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ..._buildLeftMenu(context),
        ]));
  }

  List<Widget> _buildLeftMenu(BuildContext context) {
    return [
      SideMenu(
        controller: page,
        style: SideMenuStyle(
          // showTooltip: false,
          displayMode: SideMenuDisplayMode.auto,
          hoverColor: Colors.blue[100],
          selectedColor: Colors.lightBlue,
          selectedTitleTextStyle: const TextStyle(color: Colors.white),
          selectedIconColor: Colors.white,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          // backgroundColor: Colors.blueGrey[700]
        ),
        title: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
                maxWidth: 150,
              ),
              child: Image.asset(
                'assets/images/drawer/avatar_90.gif',
              ),
            ),
            const Divider(
              indent: 8.0,
              endIndent: 8.0,
            ),
          ],
        ),
        // footer: const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Text(
        //     'mohada',
        //     style: TextStyle(fontSize: 15),
        //   ),
        // ),
        items: [
          SideMenuItem(
            priority: 0,
            title: 'Dashboard',
            onTap: () {
              page.jumpToPage(0);
            },
            icon: const Icon(Icons.home),
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            tooltipContent: "This is a tooltip for Dashboard item",
          ),
          SideMenuItem(
            priority: 1,
            title: 'Profile',
            onTap: () {
              page.jumpToPage(1);
            },
            icon: const Icon(Icons.supervisor_account),
          ),
          SideMenuItem(
            priority: 2,
            title: 'Documents',
            onTap: () {
              page.jumpToPage(2);
            },
            icon: const Icon(Icons.file_copy_rounded),
            trailing: Container(
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
                  child: Text(
                    'New',
                    style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                  ),
                )),
          ),
          SideMenuItem(
            priority: 3,
            title: 'Settings',
            onTap: () {
              page.jumpToPage(3);
            },
            icon: const Icon(Icons.settings),
          ),
          // SideMenuItem(
          //   priority: 5,
          //   onTap: () {
          //     page.jumpToPage(5);
          //   },
          //   icon: const Icon(Icons.image_rounded),
          // ),
          // SideMenuItem(
          //   priority: 6,
          //   title: 'Only Title',
          //   onTap: () {
          //     page.jumpToPage(6);
          //   },
          // ),
          const SideMenuItem(
            priority: 4,
            title: 'Secondary Market',
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      Expanded(
        child: PageView(
          controller: page,
          children: [
            DashboardMainWidget(),
            ProfilePageWidget(),
            DocumentsWidget(),
            Container(
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
          ],
        ),
      )
    ];
  }
}
