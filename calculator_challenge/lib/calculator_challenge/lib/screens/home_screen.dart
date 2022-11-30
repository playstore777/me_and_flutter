import 'package:calculator_challenge/providers/calculator_provider.dart';
import 'package:calculator_challenge/widgets/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Challenge'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.navigate_next,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/settings',
                arguments: [Provider.of<Calculator>(context, listen: false)],
              );
              // .then((dynamic value) {
              //   afterNavigatorPop();
              // });
              return;
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (ctx) => SettingScreen(),
              //   ),
              // );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: MainScreen(),
        ),
      ),
    );
  }

  // void afterNavigatorPop() {
  //   setState(() {});
  // }
}
