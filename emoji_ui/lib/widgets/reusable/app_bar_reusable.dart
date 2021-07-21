import 'package:flutter/material.dart';

class AppBarReusable extends StatelessWidget {
  final bool isIcon;
  AppBarReusable(this.isIcon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          if (!isIcon)
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200],
                image: DecorationImage(
                  image: AssetImage('assets/tuxedo.png'),
                ),
              ),
            ),
          if (isIcon)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent[100],
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
