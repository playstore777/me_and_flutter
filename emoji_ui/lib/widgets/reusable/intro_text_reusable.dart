import 'package:flutter/material.dart';

class IntroTextReusable extends StatelessWidget {
  final String? firstText, secondText;
  IntroTextReusable({this.firstText, this.secondText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText.toString(),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              secondText.toString(),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
