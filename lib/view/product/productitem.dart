import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshbucket/bloc/shop/shop_bloc.dart';
import 'package:freshbucket/view/utils/constant.dart';

class ProductItemWidget extends StatelessWidget {
  double? cardContainerH;
  String? fruitImgPath;
  String? title;
  double? price;
  bool? buy = false;
  bool? cartview = false;
  String? quantity;
  void Function()? onTap;
  void Function()? addAction;
  void Function()? minusAction;

  ProductItemWidget({
    Key? key,
    this.cardContainerH,
    this.fruitImgPath,
    this.title,
    this.price,
    this.buy,
    this.cartview,
    this.quantity,
    this.onTap,
    this.addAction,
    this.minusAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardContainerH,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset('${fruitImgPath}', fit: BoxFit.cover),
              ),
              title: Text(title != null ? '${title}' : ' ',
                  style: TextStyle(color: Colors.black)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price != null ? 'Rp. ${price}' : '',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  if (cartview == true) quantityWidget(),
                ],
              ),
              trailing: trailingWidget(),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton trailingWidget() {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: buy == true ? primaryColor : Colors.red,
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
        buy == true ? 'Buy' : 'Delete',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Row quantityWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: minusAction,
        ),
        SizedBox(
          height: quantityH,
          width: quantityW,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5)),
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: addAction,
        ),
      ],
    );
  }
}
