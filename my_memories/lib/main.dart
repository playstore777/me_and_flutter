import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/success.dart';
import 'screens/failure.dart';
import 'screens/data_input_page.dart';
import 'screens/auth_screen.dart';
import 'providers/success_provider.dart';
import 'providers/failure_provider.dart';
import 'providers/auth.dart';
import 'models/entry.dart';

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
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, SuccessProvider>(
          create: null,
          update: (ctx, authToken, previousData) => SuccessProvider(
            authToken.token,
            authToken.authUserId,
            previousData == null ? <Entry>[] : previousData as List<Entry>,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, FailureProvider>(
          create: null,
          update: (ctx, authToken, previousData) => FailureProvider(
            authToken.token,
            previousData == null ? <Entry>[] : previousData as List<Entry>,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            // home: authData.isAuth ? Home() : AuthScreen(),
            // home: Home(),
            routes: {
              '/': (_) => authData.isAuth ? Home() : AuthScreen(),
              SuccessPage.routeName: (_) => SuccessPage(),
              FailurePage.routeName: (_) => FailurePage(),
              DataInputPage.routeName: (_) => DataInputPage(),
            }),
      ),
    );
  }
}
