import 'package:freshbucket/model/product/product.dart';

class ProductService {
  Future<ProductData> getProductItems() async {
    List<ProductItem> listItems = [
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 25000,
        quantity: 1,
        title: 'Sweet Apple Indonesia',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 15000,
        quantity: 1,
        title: 'Sweet Apple Canada',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 20000,
        quantity: 1,
        title: 'Sweet Apple Japan',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 10000,
        quantity: 1,
        title: 'Sweet Apple India',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 25000,
        quantity: 1,
        title: 'Sweet Orange Indonesia',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 15000,
        quantity: 1,
        title: 'Sweet Orange Canada',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 20000,
        quantity: 1,
        title: 'Sweet Orange Japan',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 10000,
        quantity: 1,
        title: 'Sweet Orange India',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 25000,
        quantity: 1,
        title: 'Sweet Banana Indonesia',
        category: 'Banana',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 15000,
        quantity: 1,
        title: 'Sweet Banana Canada',
        category: 'Banana',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 20000,
        quantity: 1,
        title: 'Sweet Banana Japan',
        category: 'Banana',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 10000,
        quantity: 1,
        title: 'Sweet Banana India',
        category: 'Banana',
      ),
    ];

    return ProductData(listItems: listItems);
  }

  Future<ProductData> geCartItems() async {
    List<ProductItem> listItems = [
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 25000,
        quantity: 1,
        title: 'Sweet Apple Indonesia',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 15000,
        quantity: 1,
        title: 'Sweet Apple Canada',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 20000,
        quantity: 1,
        title: 'Sweet Apple Japan',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/apple.png",
        price: 10000,
        quantity: 1,
        title: 'Sweet Apple India',
        category: 'Apple',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 25000,
        quantity: 1,
        title: 'Sweet Orange Indonesia',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 15000,
        quantity: 1,
        title: 'Sweet Orange Canada',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 20000,
        quantity: 1,
        title: 'Sweet Orange Japan',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/orange.png",
        price: 10000,
        quantity: 1,
        title: 'Sweet Orange India',
        category: 'Orange',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 25000,
        quantity: 1,
        title: 'Sweet Banana Indonesia',
        category: 'Banana',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 15000,
        quantity: 1,
        title: 'Sweet Banana Canada',
        category: 'Banana',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 20000,
        quantity: 1,
        title: 'Sweet Banana Japan',
        category: 'Banana',
      ),
      ProductItem(
        fruitImg: "assets/fruitimage/banana.png",
        price: 10000,
        quantity: 1,
        title: 'Sweet Banana India',
        category: 'Banana',
      ),
    ];

    return ProductData(listItems: listItems);
  }
}
