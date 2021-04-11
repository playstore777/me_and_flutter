import 'package:flutter/material.dart';

import '../components/constants.dart';
import 'data_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kList.map((e) => print(e));
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 6.0,
          title: const Center(
            child: Text(
              'The Real Character',
              style: TextStyle(
                  // color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        // body: ListView.separated(
        //   separatorBuilder: (_, __) =>
        //       const Divider(), // takes context and index, instead we are using _ and __ as _ is already defined so, we have to use __(double underscores);
        //   itemCount: kList.length,
        //   itemBuilder: (context, index) => ListTile(
        //     contentPadding:
        //         EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        //     onTap: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) => DataScreen()));
        //     },
        //     title: Text(kList[index]),
        //   ),
        // ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  DataScreen.routeName,
                  // MaterialPageRoute(builder: (context) => DataScreen()),
                );
              },
              title: Text('Category 1'),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  DataScreen.routeName,
                );
              },
              title: Text('Category 2'),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  DataScreen.routeName,
                );
              },
              title: Text('Category 3'),
            ),
          ],
        ));
  }
}
