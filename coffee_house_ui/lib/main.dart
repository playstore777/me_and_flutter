import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) =>
    MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}
