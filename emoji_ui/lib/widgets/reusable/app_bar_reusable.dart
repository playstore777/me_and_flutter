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
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200],
                image: DecorationImage(
                  image: AssetImage('assets/tuxedo.png'),
                ),
              ),
            ),
          if (isIcon)
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent[100],
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: -3,
                  bottom: 20,
                  top: -4,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent[100],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
