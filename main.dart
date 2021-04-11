import 'package:flutter/material.dart';

main() {
  runApp(MyApp(Colors.green));
}

class MyApp extends StatelessWidget {
  final colorChanger;
  MyApp(this.colorChanger);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('1st class'),
            ),
            body: Column(children: [
              MySecondApp(),
              MyThirdApp(colorChanger),
            ])));
  }
}

class MySecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          runApp(MyApp(Colors.red));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.red,
        ));
  }
}

class MyThirdApp extends StatelessWidget {
  final color;
  MyThirdApp(this.color);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          runApp(MyApp(Colors.green));
        },
        child: Container(
            height: MediaQuery.of(context).size.height / 3, color: color));
  }
}
