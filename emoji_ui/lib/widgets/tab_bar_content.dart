import 'package:flutter/material.dart';

import '/models/food_model.dart';

class TabBarContent extends StatelessWidget {
  final List<Food> _foodList;
  TabBarContent(this._foodList);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          // top: 10,
        ),
        child: ListView.builder(
          itemBuilder: (ctx, index) => contentCard(size, _foodList[index]),
          itemCount: _foodList.length,
        ),
        // child: _foodList.map((foodItem) => contentCard(size, foodItem));,
      ),
    );
  }

  Container contentCard(Size size, Food foodItem) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: size.width * 0.15,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(
                          foodItem.image.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.08,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(foodItem.name.toString()),
                      Text(
                        foodItem.rating.toString(),
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${foodItem.discoutedPrice.toString()}',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '\$${foodItem.price.toString()}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.1,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.6),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(2, 2),
                  color: Colors.red.withOpacity(0.5),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
