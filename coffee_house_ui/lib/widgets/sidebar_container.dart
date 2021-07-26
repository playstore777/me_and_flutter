import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SideBarContainer extends StatefulWidget {
  String? name;
  var width;
  var index;
  var isSelectedFunction;
  var isSelected;
  SideBarContainer({
    this.name,
    this.width,
    this.index,
    this.isSelected,
    this.isSelectedFunction,
  });

  @override
  _SideBarContainerState createState() => _SideBarContainerState();
}

class _SideBarContainerState extends State<SideBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (widget.width / 2) * 0.1),
      child: GestureDetector(
        onTap: () {
          widget.isSelectedFunction(widget.index);
          print('index : ${widget.index}');
        },
        child: RotatedBox(
          quarterTurns: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // if (widget.isSelected[
              //     widget.index]) // more awesome looking way!(do try it out!)
              Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isSelected ? Colors.black : Colors.transparent,
                ),
              ),
              Container(
                child: Text(
                  '${widget.name}',
                  style: GoogleFonts.bigShouldersText(
                    fontSize: 20.0,
                    color: widget.isSelected ? Colors.black : Colors.grey,
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
