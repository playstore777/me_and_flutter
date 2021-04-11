import 'package:flutter/material.dart';

class DataDetailsScreen extends StatelessWidget {
  static const routeName = '/Data-Details-Screen';
  // final String title;
  // DataDetailsScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
          child: FittedBox(
        child: Text('Description of the title...'),
      )),
    );
  }
}
