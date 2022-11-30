import 'package:calculator_challenge/providers/calculator_provider.dart';
import 'package:calculator_challenge/routes/route_generator.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: GenerateAllCalculatorRoutes.generateRoute,
    );
  }
}
