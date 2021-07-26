import 'package:coffee_house_ui/widgets/product_container.dart';
import 'package:flutter/material.dart';

class ContentList extends StatelessWidget {
  final screenWidth, screenHeight;
  ContentList(this.screenHeight, this.screenWidth);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight - (screenHeight * 0.4),
      width: screenWidth - (screenWidth / 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ProductContainer(
              name: 'Grady\'s COLD BREW',
              bgimage: 'assets/doodle.png',
              image: 'assets/coffee4.png',
              color: Color(0xFFFCC07E),
              price: 150,
              ratingCount: 65,
            ),
            ProductContainer(
              name: 'Grady\'s COLD BREW',
              bgimage: 'assets/doodle.png',
              image: 'assets/coffee2.png',
              color: Color(0xFF57CFEA),
              price: 200,
              ratingCount: 65,
            ),
          ],
        ),
      ),
    );
  }
}
