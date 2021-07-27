import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  bool? grass = false;
  int _radioValue = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ExpansionTile(
              title: Text('Type'),
              children: [
                Row(
                  children: [
                    Radio<dynamic>(
                      groupValue: _radioValue,
                      value: grass,
                      onChanged: (value) {
                        print('radio button : ${value.runtimeType}');
                      },
                    ),
                    Text('Grass'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
