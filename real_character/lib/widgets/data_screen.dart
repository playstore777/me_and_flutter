import 'package:flutter/material.dart';

import 'data_details_screen.dart';

class DataScreen extends StatefulWidget {
  static const routeName = '/Data-Screen';
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool isSwitch = true;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final title = data['title'];
    final Map<String, String> dataMap = data['dataMap'];
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        actions: [
          (isSwitch)
              ? const Center(
                  child: Text(
                    'Type A',
                  ),
                )
              : const Center(
                  child: Text(
                    'Type B',
                  ),
                ),
          Switch(
            activeColor: Colors.pink,
            inactiveThumbColor: Colors.blue,
            value: isSwitch,
            onChanged: (val) {
              setState(() {
                isSwitch = !isSwitch;
              });
            },
          )
        ],
      ),
      body: (isSwitch)
          ? ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DataDetailsScreen.routeName,
                    arguments: {
                      'title': 'Type A Title here',
                    },
                  );
                },
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                      'Type A Title here.............................................................'),
                ),
                subtitle: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                      'Little bit of description, tappable..........................................................................................................................'),
                ),
              ),
            )
          : ListView.builder(
              // Issue is here!
              itemCount: dataMap.length,
              itemBuilder: (context, index) {
                return dataMap.forEach((key, value) => ListTile(
                      title: Text(key),
                    ));
                // return ListTile(
                //   onTap: () {
                //     Navigator.of(context).pushNamed(
                //       DataDetailsScreen.routeName,
                //       arguments: {
                //         'title': 'Type B Title here',
                //       },
                //     );
                //   },
                //   title: Text('Type B Title here'),
                //   subtitle: Text(
                //       'Little bit of description, tappable..........................................................................................................................'),
                // );
              },
            ),
    );
  }
}
