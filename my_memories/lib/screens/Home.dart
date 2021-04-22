import 'package:flutter/material.dart';

import 'success.dart';
import 'failure.dart';
import '../widgets/appbar_drawer.dart';

Map<String, String> failureMap = {};

class Home extends StatelessWidget {
  final List<Widget> tabsData = [
    SuccessPage(),
    FailurePage(),
  ];

  final List<Widget> tabs = [
    Icon(Icons.domain_verification),
    Icon(Icons.sms_failed_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.height * 0.02;
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            drawer: Drawer(
              child: Center(
                child: Text('Hello Friends Chai Peelo!!'),
              ),
            ),
            appBar: AppBar(
              leading: MyAppDrawer(),
              title: Center(child: Text('My Memories')),
            ),
            body: TabBarView(
              children: tabsData,
            ),
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: TabBar(
                  tabs: tabs,
                ),
              ),
              elevation: 6.0,
            ),
          );
        },
      ),
    );
  }
}
