import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String text;
  ErrorScreen(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Data!'),
      ),
      body: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
