import 'package:flutter/material.dart';

import 'data_input_page.dart';
import '../widgets/data_list_view.dart';
import '../providers/success_provider.dart';

import 'package:provider/provider.dart';

class SuccessPage extends StatelessWidget {
  static const routeName = 'success-page';
  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<SuccessProvider>(context).successList;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataInputPage(
                    isSuccess: true,
                  ),
                ));
          }),
      body:
          // dataList.length <= 0
          //     ? Container(
          //         child: Center(
          //           child: Text('No stories added to show!'),
          //         ),
          //       )
          //     :
          DataListView(dataList, true),
    );
  }
}
