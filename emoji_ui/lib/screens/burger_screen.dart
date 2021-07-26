import 'package:flutter/material.dart';

import '/widgets/reusable/intro_text_reusable.dart';
import '/widgets/reusable/app_bar_reusable.dart';

class BurgerScreen extends StatefulWidget {
  @override
  _BurgerScreenState createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBarReusable(true),
            IntroTextReusable(
              firstText: 'SUPER',
              secondText: 'BEEF BURGER',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width * 0.6,
                      child: Image(
                        image: AssetImage('assets/burger.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(5, 12),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red[200],
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(5, 12),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.red[200],
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 40),
                  child: Container(
                    width: size.width * 0.2,
                    child: FittedBox(
                      child: Text(
                        '\$42',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.red.withOpacity(0.7),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: Container(
                            width: size.width * 0.25,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FittedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      print(
                                          'remove icon button from burger_screen');
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.red[300],
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red[300],
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      print(
                                          'add icon button from burger_screen');
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.red[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 15,
                bottom: 10,
              ),
              child: Container(
                child: Text(
                  'FEATURED',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _featuredCard(
                          size: size,
                          name: 'Sweet cheese',
                          color: Colors.purple[100],
                          price: '11',
                          image: 'assets/cheese.png',
                        ),
                        _featuredCard(
                          size: size,
                          name: 'Sweet popcorn',
                          color: Colors.red[100],
                          price: '6',
                          image: 'assets/popcorn.png',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _featuredCard(
                          size: size,
                          name: 'Taco',
                          color: Colors.blue[100],
                          price: '6',
                          image: 'assets/taco.png',
                        ),
                        _featuredCard(
                          size: size,
                          name: 'Sandwich',
                          color: Colors.green[100],
                          price: '6',
                          image: 'assets/sandwich.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _featuredCard({size, name, color, price, image}) {
    return Container(
      child: Row(
        children: [
          Container(
            width: size.width * 0.16,
            height: size.height * 0.08,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image(
                image: AssetImage('${image.toString()}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.45),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      color: Colors.red[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
