import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.name,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.5,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: screenHeight * 0.08,
            left: screenWidth * 0.25,
            child: Text(
              '$name',
              style: GoogleFonts.bigShouldersText(
                fontSize: ((screenHeight + screenWidth) / 2) * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.028,
            left: screenWidth * 0.145,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_box,
                        ),
                        Text('1.5K'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                  width: 2.5,
                  height: screenHeight / 2 * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_box,
                        ),
                        Text('1.5K'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                  width: 2.5,
                  height: screenHeight / 2 * 0.055,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_box,
                        ),
                        Text('1.5K'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
