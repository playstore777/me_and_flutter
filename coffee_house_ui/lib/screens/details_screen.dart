import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '/widgets/custom_appbar.dart';
import '/widgets/product_details.dart';

class DetailsScreen extends StatelessWidget {
  final name, image;
  DetailsScreen({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Color(0xFFF8F6),
                ),
                Positioned(
                  bottom: screenHeight * 0.1,
                  left: screenWidth * 0.1,
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.068,
                    decoration: BoxDecoration(
                      color: Color(0xfffD866E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.bigShouldersText(
                          fontSize: ((screenHeight + screenWidth) / 2) * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.1,
                  right: screenWidth * 0.1,
                  child: Container(
                    width: screenWidth * 0.14,
                    height: screenHeight * 0.068,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xfffD866E),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.bookmark_border,
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.15,
                  left: screenWidth * 0.1,
                  child: _moreProducts(screenWidth * 0.8, screenHeight * 0.2),
                ),
                Positioned(
                  bottom: screenHeight * 0.43,
                  left: screenWidth * 0.1,
                  child: Text(
                    'About Us',
                    style: GoogleFonts.bigShouldersText(
                      fontSize: ((screenHeight + screenWidth) / 2) * 0.07,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.35,
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                  child: Text(
                    'Cold brewed with chicory and a unique blend of spices for 20 hours, our concentrate is velvety-smooth and packed with flavor.',
                    style: GoogleFonts.bigShouldersText(
                      fontSize: ((screenHeight + screenWidth) / 2) * 0.025,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ProductDetails(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  name: name,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/doodle.png'),
                      fit: BoxFit.none,
                    ),
                  ),
                  width: screenWidth,
                  height: screenHeight * 0.3,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF57CFEA),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  width: screenWidth,
                  height: screenHeight * 0.3,
                ),
                CustomAppBar(false, Colors.white),
                Positioned(
                  right: screenWidth * 0.22,
                  top: screenHeight * 0.05,
                  child: Hero(
                    tag: 'myHeroAnimationTag$image',
                    child: Container(
                      width: screenWidth * 0.6,
                      child: Image(
                        image: AssetImage('$image'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _moreProducts(containerWidth, containerHeight) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          moreProductsContainer(
            containerWidth,
            containerHeight,
            '65.00',
            'COLD BREW KIT',
          ),
          moreProductsContainer(
            containerWidth,
            containerHeight,
            '120.00',
            'COLD BREW KIT',
          ),
        ],
      ),
    );
  }

  Container moreProductsContainer(
      containerWidth, containerHeight, price, name) {
    return Container(
      width: containerWidth * 0.8,
      height: containerHeight * 0.5,
      child: Stack(
        children: [
          Positioned(
            top: containerHeight * 0.3,
            child: Container(
              width: containerWidth * 0.72,
              height: containerHeight * 0.5,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: containerHeight * 0.45,
            left: containerWidth * 0.05,
            child: Text(
              '\$$price',
              style: GoogleFonts.bigShouldersText(
                fontSize: ((containerHeight + containerWidth) / 2) * 0.13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF57CFEA),
              ),
            ),
          ),
          Positioned(
            bottom: containerHeight * 0.25,
            left: containerWidth * 0.065,
            child: Text(
              '$name',
              style: GoogleFonts.bigShouldersText(
                fontSize: ((containerHeight + containerWidth) / 2) * 0.09,
                fontWeight: FontWeight.bold,
                color: Color(0xfff1F0D3C),
              ),
            ),
          ),
          Positioned(
            right: containerWidth * 0.17,
            bottom: containerHeight * 0.4,
            child: Container(
              width: containerWidth * 0.2,
              height: containerHeight * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: containerWidth * 0.01,
            bottom: containerHeight * 0.3,
            child: Container(
              width: containerWidth * 0.45,
              height: containerHeight * 0.75,
              child: Image(
                image: AssetImage('assets/coffee3.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
