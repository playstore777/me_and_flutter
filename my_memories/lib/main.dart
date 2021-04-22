import 'package:flutter/material.dart';

import './screens/home.dart';
import 'screens/success.dart';
import 'screens/failure.dart';
import './screens/data_input_page.dart';
import './providers/success_provider.dart';
import './providers/failure_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SuccessProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FailureProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          routes: {
            '/': (_) => Home(),
            SuccessPage.routeName: (_) => SuccessPage(),
            FailurePage.routeName: (_) => FailurePage(),
            DataInputPage.routeName: (_) => DataInputPage(),
          }),
    );
  }
}
