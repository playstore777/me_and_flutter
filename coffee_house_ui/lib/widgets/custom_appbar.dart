import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final isDashboard, color;
  CustomAppBar([this.isDashboard = true, this.color = Colors.black]);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (isDashboard)
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, left: 42),
                  child: Icon(Icons.menu),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: color,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 42),
            child: Icon(
              Icons.shopping_basket_rounded,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
