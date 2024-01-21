import 'restaurant.dart';

class RestaurantRepo {
  static List<Restaurant> loadRes(Category category) {
    const allRes = <Restaurant>[
      Restaurant(
          category: Category.chicken,
          id: 0,
          isFeatured: true,
          name: "Momos",
          location: "nearby"),
      Restaurant(
          category: Category.bougie,
          id: 1,
          isFeatured: true,
          name: "Boo",
          location: "nearby"),
      Restaurant(
          category: Category.bougie,
          id: 2,
          isFeatured: true,
          name: "Oodles",
          location: "nearby")
    ];

    return allRes;
  }
}
