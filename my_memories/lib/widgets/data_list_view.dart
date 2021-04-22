import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/success_provider.dart';
import '../providers/failure_provider.dart';
import '../screens/entry_view_screen.dart';

class DataListView extends StatefulWidget {
  final dataList, isSuccess;
  DataListView(this.dataList, this.isSuccess);

  @override
  _DataListViewState createState() => _DataListViewState();
}

class _DataListViewState extends State<DataListView> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<SuccessProvider>(context, listen: false).fetchEntries();
      Provider.of<FailureProvider>(context, listen: false).fetchEntries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.dataList.length <= 0 || widget.dataList == null
        ? Container(
            child: Center(
              child: Text('Please add stories to show!'),
            ),
          )
        : ListView.builder(
            itemCount: widget.dataList.length,
            itemBuilder: (ctx, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => EntryViewScreen(
                    index,
                    widget.isSuccess,
                  ),
                ));
              },
              title: Text(
                widget.dataList[index].title,
                maxLines: 1,
              ),
              subtitle: SizedBox(
                child: Text(
                  widget.dataList[index].description,
                  maxLines: 2,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      '${widget.dataList[index].date.hour}:${widget.dataList[index].date.minute}:${widget.dataList[index].date.second}'),
                  Text(
                      '${widget.dataList[index].date.day}/${widget.dataList[index].date.month}/${widget.dataList[index].date.year}'),
                ],
              ),
            ),
          );
  }
}
