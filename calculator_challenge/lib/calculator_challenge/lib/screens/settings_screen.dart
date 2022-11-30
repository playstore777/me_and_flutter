import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class SettingScreen extends StatefulWidget {
  final providerData;
  SettingScreen(this.providerData);
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _textEditingController,
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              widget.providerData[0]
                  .secretTextSetter(_textEditingController.text.toString());
            },
          )
        ],
      ),
    );
  }
}
