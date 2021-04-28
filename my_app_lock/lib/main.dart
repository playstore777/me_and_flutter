import 'package:flutter/material.dart';

import 'package:flutter_app_lock/flutter_app_lock.dart';

void main() {
  runApp(
    AppLock(
      builder: (args) => MyApp(data: args),
      lockScreen: LockScreen(),
    ),
  );
}

class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('LockScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text('LockScreen'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('My Button!'),
        onPressed: () {
          print('Button Pressed');
          AppLock.of(context).didUnlock('And');
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (ctx) => MyApp(),
          //   ),
          // );
        },
      )),
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final data;
  MyApp({this.data});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var enable = true;
  @override
  Widget build(BuildContext context) {
    print('data : ${widget.data}');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
          actions: <Widget>[
            Switch(
                value: enable,
                onChanged: (change) {
                  print('$change, enable $enable');
                  AppLock.of(context).setEnabled(enable);
                  setState(() {
                    enable = change;
                  });
                })
          ],
        ),
        body: Center(
          child: TextButton(
            child: Text('Open AppLock!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => LockScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
