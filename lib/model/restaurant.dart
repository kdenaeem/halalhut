enum Category { chicken, bougie, fastFood, burgers, desert }

class Restaurant {
  const Restaurant(
      {required this.category,
      required this.id,
      required this.isFeatured,
      required this.name,
      required this.location});

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final String location;

  String get assetName => '$name-i.png';

  @override
  String toString() => "$name (id=$id)";
}
