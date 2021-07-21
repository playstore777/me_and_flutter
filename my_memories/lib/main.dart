import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/success.dart';
import 'screens/failure.dart';
import 'screens/data_input_page.dart';
import 'screens/auth_screen.dart';
import 'providers/success_provider.dart';
import 'providers/failure_provider.dart';
import 'providers/auth.dart';
// import 'auth/auth_screen_sdk.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
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
          update: (ctx, auth, previousData) => SuccessProvider(
            auth.token,
            auth.authUserId,
            previousData == null ? [] : previousData.successList,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, FailureProvider>(
          create: null,
          update: (ctx, auth, previousData) => FailureProvider(
            auth.token,
            auth.authUserId,
            previousData == null ? [] : previousData.failureList,
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
            // home: StreamBuilder(
            //   stream: FirebaseAuth.instance.authStateChanges(),
            //   builder: (ctx, userSnapshot) {
            //     if (userSnapshot.hasData) return Home();
            //     return AuthScreenSDK();
            //   },
            // ),
            routes: {
              '/': (_) => authData.isAuth
                  ? Home()
                  : FutureBuilder(
                      future: authData.autoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : AuthScreen(),
                    ),
              SuccessPage.routeName: (_) => SuccessPage(),
              FailurePage.routeName: (_) => FailurePage(),
              DataInputPage.routeName: (_) => DataInputPage(),
            }),
      ),
    );
  }
}
