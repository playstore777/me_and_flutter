import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences prefs;

class DataInputPage extends StatefulWidget {
  final Map<String, String> successMap;
  final Map<String, String> failureMap;

  final bool isSuccess;
  DataInputPage({this.successMap, this.failureMap, this.isSuccess});

  @override
  _DataInputPageState createState() => _DataInputPageState();
}

class _DataInputPageState extends State<DataInputPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (widget.isSuccess)
            ? Text('Add Success Story')
            : Text('Add Failure Story'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              var title = titleController.text;
              var desc = descriptionController.text;
              setState(() {
                if (this.widget.isSuccess) {
                  widget.successMap[title] = desc;
                  Navigator.of(context).pop(widget.successMap);
                } else {
                  widget.failureMap[title] = desc;
                  Navigator.of(context).pop(widget.failureMap);
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Title(only text is accepted)',
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
    );
  }
}
