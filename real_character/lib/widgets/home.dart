import 'package:flutter/material.dart';

import '../components/constants.dart';
import 'data_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    kList.map((e) => print(e));
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage("https://wallpaperaccess.com/full/4475416.jpg"),
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
                  Navigator.of(context).pushNamed(
                    DataScreen.routeName,
                    // MaterialPageRoute(builder: (context) => DataScreen()),
                  );
                },
                title: Text(
                  'Category 1',
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
                  Navigator.of(context).pushNamed(
                    DataScreen.routeName,
                  );
                },
                title: Text(
                  'Category 2',
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
                  Navigator.of(context).pushNamed(
                    DataScreen.routeName,
                  );
                },
                title: Text(
                  'Category 3',
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
