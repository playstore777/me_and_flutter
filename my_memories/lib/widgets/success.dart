import 'package:flutter/material.dart';

import '../components/dataInputPage.dart';

class SuccessPage extends StatefulWidget {
  var dataMap;

  SuccessPage({this.dataMap});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DataInputPage(
                  successMap: widget.dataMap,
                  isSuccess: true,
                ),
              ),
            ).then((value) {
              setState(() {
                widget.dataMap = value;
              });
            });
          },
        ),
        body: ListView.builder(
            itemCount: (widget.dataMap.length > 0) ? widget.dataMap.lenght : 0,
            itemBuilder: (context, index) {
              var temp = widget.dataMap.keys.toList();
              return ListTile(
                title: Text(temp[index]),
                subtitle: SizedBox(
                  child: Text(widget.dataMap[temp[index]]),
                ),
              );
            }));
  }
}
