import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class PokeDetailScreen extends StatelessWidget {
  final pokemon;
  PokeDetailScreen(this.pokemon);
  @override
  Widget build(BuildContext context) {
    // print(pokemon['weaknesses']);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          pokemon['name'],
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.09,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: screenWidth * 0.8,
              height: screenHeight * 0.5,
            ),
          ),
          Positioned(
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.65,
            right: screenWidth * 0.26,
            left: screenWidth * 0.26,
            child: FittedBox(
              child: Hero(
                tag: 'HeroImage${pokemon["id"]}',
                child: Image(
                  width: screenWidth * 0.48,
                  height: screenHeight * 0.26,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    pokemon['img'],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.22,
            right: screenWidth * 0.4,
            left: screenWidth * 0.4,
            child: FittedBox(
              child: Text(
                pokemon['name'],
                style: GoogleFonts.aBeeZee(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.28,
            right: screenWidth * 0.38,
            child: Text(
              "height : ${pokemon['height']}",
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.32,
            right: screenWidth * 0.36,
            child: Text(
              "weight : ${pokemon['weight']}",
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.36,
            right: screenWidth * 0.42,
            child: Text(
              "Types",
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.4,
            left: screenWidth * 0.15,
            right: screenWidth * 0.15,
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.03,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pokemon['type'].length,
                itemBuilder: (ctx, index) => type(
                  screenWidth,
                  screenHeight,
                  pokemon['type'][index],
                  Colors.amber,
                  Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            right: screenWidth * 0.38,
            child: Text(
              'Weakness',
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: screenWidth * 0.15,
            right: screenWidth * 0.15,
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.03,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pokemon['weaknesses'].length,
                itemBuilder: (ctx, index) => type(
                  screenWidth,
                  screenHeight,
                  pokemon['weaknesses'][index],
                  Colors.red,
                  Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget type(
    double screenWidth,
    double screenHeight,
    String _type,
    Color color,
    Color textColor,
  ) {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02),
      child: Container(
        width: screenWidth * 0.14,
        height: screenHeight * 0.032,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          _type,
          style: GoogleFonts.alice(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
