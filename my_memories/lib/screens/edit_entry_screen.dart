import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/success_provider.dart';
import '../providers/failure_provider.dart';

class EditEntryScreen extends StatefulWidget {
  final String id;
  final bool isSuccess;
  EditEntryScreen({this.id, this.isSuccess});
  @override
  _EditEntryScreenState createState() => _EditEntryScreenState();
}

class _EditEntryScreenState extends State<EditEntryScreen> {
  final _form = GlobalKey<FormState>();
  FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final successProvider = Provider.of<SuccessProvider>(context);
    final failureProvider = Provider.of<FailureProvider>(context);
    final entryData = widget.isSuccess
        ? successProvider.successList
            .firstWhere((entry) => entry.id == widget.id)
        : failureProvider.failureList
            .firstWhere((entry) => entry.id == widget.id);
    String _title = entryData.title;
    String _description = entryData.description;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Entry'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _form.currentState.save();
              if (widget.isSuccess) {
                successProvider
                    .updateData(
                  id: entryData.id,
                  title: _title == null ? entryData.title : _title,
                  description: _description == null
                      ? entryData.description
                      : _description,
                  date: entryData.date,
                )
                    .catchError((error) {
                  return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Error occured while updating!'),
                            content: Text('$error occured while updating!'),
                            actions: [
                              TextButton(
                                child: Text('Okay'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ));
                });
                print('title: $_title');
                Navigator.of(context).pop();
              } else {
                failureProvider.updateData(
                  id: entryData.id,
                  title: _title == null ? entryData.title : _title,
                  description: _description == null
                      ? entryData.description
                      : _description,
                  date: entryData.date,
                );
                print('desc : $_description');
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              initialValue: entryData.title,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
              onSaved: (text) {
                setState(() {
                  _title = text == null ? _title : text;
                });
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            TextFormField(
              focusNode: _descriptionFocusNode,
              initialValue: entryData.description,
              keyboardType: TextInputType.multiline,
              maxLines: 20,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              onSaved: (text) {
                setState(() {
                  _description = text == null ? _description : text;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
