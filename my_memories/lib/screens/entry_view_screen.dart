import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/success_provider.dart';
import '../providers/failure_provider.dart';
import '../screens/error_screen.dart';
import '../screens/edit_entry_screen.dart';

class EntryViewScreen extends StatefulWidget {
  final int index;
  final bool isSuccess;
  EntryViewScreen(this.index, this.isSuccess);

  @override
  _EntryViewScreenState createState() => _EntryViewScreenState();
}

class _EntryViewScreenState extends State<EntryViewScreen> {
  @override
  Widget build(BuildContext context) {
    final successData = Provider.of<SuccessProvider>(context);
    final failureData = Provider.of<FailureProvider>(context);
    return (!successData.successList.asMap().containsKey(widget.index))
        ? ErrorScreen('The Story no longer exist!')
        : Scaffold(
            appBar: AppBar(
              title: widget.isSuccess
                  ? Text(successData.successList[widget.index].title)
                  : Text(failureData.failureList[widget.index].title),
              actions: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    if (widget.isSuccess) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => EditEntryScreen(
                          id: successData.successList[widget.index].id,
                          isSuccess: true,
                        ),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => EditEntryScreen(
                          id: failureData.failureList[widget.index].id,
                          isSuccess: false,
                        ),
                      ));
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      if (widget.isSuccess) {
                        successData
                            .delete(successData.successList[widget.index].id);
                        Navigator.of(context).pop();
                      } else {
                        failureData
                            .delete(failureData.failureList[widget.index].id);
                        Navigator.of(context).pop();
                      }
                    });
                  },
                ),
              ],
            ),
            // body: ListTile(
            //   title: Text(data.title),
            //   subtitle: Text(data.description),
            // ),
            body: Card(
              elevation: 5.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 0.0,
                      child: widget.isSuccess
                          ? Text(
                              successData.successList[widget.index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Text(
                              failureData.failureList[widget.index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                    Divider(),
                    Card(
                      elevation: 0.0,
                      child: widget.isSuccess
                          ? Text(
                              successData.successList[widget.index].description,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            )
                          : Text(
                              failureData.failureList[widget.index].description,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
