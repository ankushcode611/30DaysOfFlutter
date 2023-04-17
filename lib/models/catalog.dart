class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: "iPhone 14",
      desc:
          "The latest smartphone from Apple with a new A15 Bionic chip and Ceramic Shield",
      price: 799,
      color: "Midnight",
      image:
          "https://media.croma.com/image/upload/v1662655662/Croma%20Assets/Communication/Mobiles/Images/261979_oq7vjv.png",
    ),
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}
