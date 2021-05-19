import 'package:flutter/material.dart';

import '../components/constants.dart';
import 'data_maps/data_map_i.dart';
import 'data_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Constants.kList.map((e) => print(e));
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            // 'https://images.unsplash.com/photo-1489549132488-d00b7eee80f1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmlnaHR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'), // this one is actually good bro!
            'https://images.pexels.com/photos/1136575/pexels-photo-1136575.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'), // and this one too!
        // 'data:image/jpeg;base64,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'),
        // "https://wallpaperaccess.com/full/4475416.jpg"),
        // "https://www.wallpapertip.com/wmimgs/47-478000_night-mode-wallpaper-hd.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
                  top: size.height * 0.01,
                  bottom: size.height * 0.01,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(DataScreen.routeName,
                      arguments: {
                        'title': 'H',
                        'dataMap': Constants.kDataMapH,
                      }
                      // MaterialPageRoute(builder: (context) => DataScreen()),
                      );
                },
                title: Text(
                  'H',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * 0.025,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: size.height * 0.01,
                  bottom: size.height * 0.01,
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(DataScreen.routeName, arguments: {
                    'title': 'C',
                    'dataMap': Constants.kDataMapC,
                  });
                },
                title: Text(
                  'C',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * 0.025,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(DataScreen.routeName, arguments: {
                    'title': 'I',
                    'dataMap': DataMapI,
                  });
                },
                title: Text(
                  'I',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * 0.025,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
