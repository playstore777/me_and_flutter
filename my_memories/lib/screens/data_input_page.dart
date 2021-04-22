import 'package:flutter/material.dart';

import '../providers/success_provider.dart';
import '../providers/failure_provider.dart';

import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences prefs;

class DataInputPage extends StatelessWidget {
  static const routeName = 'data-input-page';

  final bool isSuccess;
  DataInputPage({this.isSuccess});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final successProviderData =
        Provider.of<SuccessProvider>(context, listen: false);
    final failureProviderData =
        Provider.of<FailureProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title:
            (isSuccess) ? Text('Add Success Story') : Text('Add Failure Story'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              var title = titleController.text;
              var desc = descriptionController.text;
              if (this.isSuccess) {
                successProviderData
                    .addData(
                  id: 's' +
                      (successProviderData.successList.length + 1).toString(),
                  title: title,
                  description: desc,
                  date: DateTime.now(),
                )
                    .catchError((error) {
                  return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('An error occured!'),
                            content: Text('Saving failed because of : $error'),
                            actions: [
                              TextButton(
                                  child: Text('Okay!'),
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed('/'))
                              // onPressed: () => Navigator.of(context).pop())
                            ],
                          ));
                });
                Navigator.of(context).pop();
              } else {
                failureProviderData
                    .addData(
                  id: 's' +
                      (failureProviderData.failureList.length + 1).toString(),
                  title: title,
                  description: desc,
                  date: DateTime.now(),
                )
                    .catchError((_) {
                  return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('An error occured!'),
                            content: Text('Saving failed!'),
                          ));
                });
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Form(
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.77,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
