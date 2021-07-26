import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_house_ui/screens/details_screen.dart';

class ProductContainer extends StatelessWidget {
  final name, bgimage, image, color, price, ratingCount;
  ProductContainer({
    this.name,
    this.image,
    this.bgimage,
    this.color,
    this.price,
    this.ratingCount,
  });
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => DetailsScreen(
              image: image,
              name: name,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: containerWidth * 0.6,
            height: containerHeight * 0.38,
            child: Padding(
              padding: EdgeInsets.only(top: containerHeight * 0.1),
              child: Stack(
                children: [
                  Container(
                    width: containerWidth * 0.6,
                    height: containerHeight * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('$bgimage'),
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Container(
                    width: containerWidth * 0.6,
                    height: containerHeight * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color.withOpacity(0.95),
                    ),
                  ),
                  Positioned(
                    top: containerHeight * 0.04,
                    left: containerWidth * 0.07,
                    child: Text(
                      'Price',
                      style: GoogleFonts.bigShouldersText(
                        fontSize: (containerHeight + containerWidth) * 0.02,
                        color: Color(0xFF1F0D3C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: containerHeight * 0.07,
                    left: containerWidth * 0.07,
                    child: Text(
                      '\$$price',
                      style: GoogleFonts.bigShouldersText(
                        fontSize: (containerHeight + containerWidth) * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: containerHeight * 0.08,
                    left: containerWidth * 0.07,
                    child: Text(
                      '$name',
                      style: GoogleFonts.bigShouldersText(
                        fontSize: (containerHeight + containerWidth) * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F0D3C),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: containerHeight * 0.04,
                    left: containerWidth * 0.07,
                    child: Text(
                      '$ratingCount',
                      style: GoogleFonts.bigShouldersText(
                        fontSize: (containerHeight + containerWidth) * 0.015,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: containerHeight * 0.04,
                    left: containerWidth * 0.14,
                    child: Text(
                      'review',
                      style: GoogleFonts.bigShouldersText(
                        fontSize: (containerHeight + containerWidth) * 0.015,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: containerHeight * 0.01,
                    left: containerWidth * 0.06,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: (containerHeight + containerWidth) * 0.016,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: (containerHeight + containerWidth) * 0.016,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: (containerHeight + containerWidth) * 0.016,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white.withOpacity(0.6),
                          size: (containerHeight + containerWidth) * 0.016,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white.withOpacity(0.6),
                          size: (containerHeight + containerWidth) * 0.016,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: containerHeight * 0.01,
                    right: containerWidth * 0.05,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: (containerWidth / 2) * 0.35,
                        height: (containerHeight / 2) * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xFF1F0D3C),
                            ),
                            Text(
                              'Add',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F0D3C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: containerWidth / 2 * 0.36,
            top: (containerHeight * 0.03),
            child: Hero(
              tag: 'myHeroAnimationTag',
              child: Container(
                width: containerWidth * 0.3,
                height: containerHeight * 0.20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('$image'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
