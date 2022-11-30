import 'package:calculator_challenge/providers/calculator_provider.dart';
import 'package:calculator_challenge/screens/notes_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/route_generator.dart';

// void main() async {
//   runApp(new AppEntry());
// }

class AppEntry extends StatelessWidget {
  final BuildContext ctx;
  AppEntry(this.ctx);
  @override
  Widget build(BuildContext context) {
    print('ctx from AppEntry: $ctx');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      onGenerateRoute: GenerateAllNotesRoutes.generateRoute,
      home: NotesHomeScreen(ctx),
      // ChangeNotifierProvider(
      //   create: (_) => Calculator(),
      //   child: NotesHomeScreen(ctx),
      // ),
    );
  }
}
