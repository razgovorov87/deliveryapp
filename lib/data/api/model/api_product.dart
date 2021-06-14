class ApiProduct {
  final String title;
  final String imgPath;
  final int price;

  ApiProduct.fromApi(map)
      : title = map['title'],
        imgPath = map['imgPath'],
        price = map['price'];
}
