import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String? image;
  final String? text, price;
  RecommendedCard({
    this.color,
    this.image,
    this.text,
    this.price,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.22,
        decoration: BoxDecoration(
          color: color?.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: size.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 13),
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Image(
                    image: AssetImage(image.toString()),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  text.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: textColor,
                  ),
                ),
                Text(
                  '\$${price.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
