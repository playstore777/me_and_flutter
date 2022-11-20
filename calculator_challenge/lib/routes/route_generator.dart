import 'package:calculator_challenge/screens/home_screen.dart';
import 'package:calculator_challenge/screens/settings_screen.dart';
import 'package:calculator_challenge/screens/text_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../screens/notes_home_screen.dart';
import '../screens/notes_edit.dart';

class GenerateAllNotesRoutes {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(
      //       builder: (context) => ChangeNotifierProvider(
      //             create: (_) => Calculator(),
      //             child: NotesHomeScreen(),
      //           ));
      case '/notes_edit':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => Calculator(),
                  child: NotesEdit(settings.arguments),
                ));
      default:
        return _unknownRoute();
    }
  }
}

class GenerateAllCalculatorRoutes {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => Calculator(),
                  child: HomeScreen(),
                ));
      case '/settings':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => Calculator(),
                  child: SettingScreen(settings.arguments),
                ));
      case '/text':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => Calculator(),
                  child: TextScreen(settings.arguments),
                ));
      default:
        return _unknownRoute();
    }
  }
}

Route<dynamic> _unknownRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oops!'),
      ),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  });
}
