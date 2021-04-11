import 'package:flutter/material.dart';

import '../widgets/success.dart';
import '../widgets/failure.dart';

Map<String, String> successMap = {};
Map<String, String> failureMap = {};

class Home extends StatelessWidget {
  static const routeName = '/';
  final List<Widget> tabsData = [
    SuccessPage(
      dataMap: successMap,
    ),
    FailurePage(
      dataMap: failureMap,
    ),
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
            appBar: AppBar(
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
