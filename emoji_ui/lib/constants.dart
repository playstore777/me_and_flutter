import '/models/food_model.dart';

class Constants {
  static List<Food> featuredList = [
    Food(
      name: 'Delicious hot dog',
      price: 18,
      image: 'assets/hotdog.png',
      discoutedPrice: 6,
      rating: '⭐⭐⭐⭐',
    ),
    Food(
      name: 'Cheese pizza',
      price: 18,
      image: 'assets/pizza.png',
      discoutedPrice: 12,
      rating: '⭐⭐⭐⭐',
    ),
  ];
}
