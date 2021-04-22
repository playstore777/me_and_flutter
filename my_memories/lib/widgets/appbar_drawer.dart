import 'package:flutter/material.dart';

class MyAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.all_inclusive_sharp),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
}
