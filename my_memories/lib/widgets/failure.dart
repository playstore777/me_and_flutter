import 'package:flutter/material.dart';

import '../components/dataInputPage.dart';

class FailurePage extends StatefulWidget {
  var dataMap;
  FailurePage({this.dataMap});

  @override
  _FailurePageState createState() => _FailurePageState();
}

class _FailurePageState extends State<FailurePage> {
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
                  failureMap: widget.dataMap,
                  isSuccess: false,
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
