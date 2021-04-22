import 'package:flutter/material.dart';

import 'data_input_page.dart';
import '../providers/failure_provider.dart';
import '../widgets/data_list_view.dart';

import 'package:provider/provider.dart';

class FailurePage extends StatelessWidget {
  static const routeName = 'failure-page';
  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<FailureProvider>(context).failureList;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DataInputPage(
                isSuccess: false,
              ),
            ),
          );
        },
      ),
      body: DataListView(dataList, false),
    );
  }
}
