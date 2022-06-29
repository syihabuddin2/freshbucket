class ProductData {
  List<ProductItem>? listItems;

  ProductData({this.listItems});
}

class ProductItem {
  String? fruitImg;
  String? title;
  double? price;
  int quantity;
  String? category;

  ProductItem({
    this.fruitImg,
    this.title,
    this.price,
    required this.quantity,
    this.category,
  });
}
