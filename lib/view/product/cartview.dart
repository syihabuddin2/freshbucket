import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshbucket/bloc/shop/shop_bloc.dart';
import 'package:freshbucket/model/product/product.dart';
import 'package:freshbucket/view/product/productitem.dart';
import 'package:freshbucket/view/utils/common/scaffoldwidget.dart';
import 'package:freshbucket/view/utils/common/topbarwidget.dart';
import 'package:freshbucket/view/utils/constant.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<ProductItem>? listItems = [];
  double totalAmount = 0;
  void calculateTotalAmount(List<ProductItem> list) {
    double res = 0;

    list.forEach((element) {
      res = res + element.price! * element.quantity;
    });
    totalAmount = res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        if (state is ItemAddedCartState) {
          listItems = state.cartItems;
          print('listItems: ${listItems!.length}');
          calculateTotalAmount(listItems!);
        }
        if (state is ShopPageLoadedState) {
          listItems = state.cartData!.listItems;
          calculateTotalAmount(listItems!);
        }
        if (state is ItemDeletingCartState) {
          listItems = state.cartItems;
          calculateTotalAmount(listItems!);
        }

        if (state is ItemAddingCartState) {
          listItems = state.cartItems;
          calculateTotalAmount(listItems!);
        }

        return ScaffoldWidget(
          topBarWidget: TopBarWidget(
            theme: primaryColor,
            title: 'Cart Product',
          ),
          body: body(context, orientation, state),
          currentIndex: 1,
        );
      },
    );
  }

  body(context, Orientation orientation, state) {
    ///Responsive layout
    responsiveLayout(orientation);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: cartH,
        width: cartW,
        child: Column(
          children: [
            Container(
              height: listCartH,
              width: listCartW,
              child: ListView.builder(
                itemCount: listItems!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ProductItemWidget(
                        cardContainerH: listCartH * 0.25,
                        fruitImgPath: listItems!.elementAt(index).fruitImg,
                        title: listItems!.elementAt(index).title,
                        price: listItems!.elementAt(index).price,
                        cartview: true,
                        quantity: listItems![index].quantity.toString(),
                        minusAction: () {
                          if (listItems![index].quantity > 0) {
                            setState(() {
                              calculateTotalAmount(listItems!);
                              listItems![index].quantity--;
                            });
                          }
                        },
                        addAction: () {
                          setState(() {
                            calculateTotalAmount(listItems!);
                            listItems![index].quantity++;
                          });
                        },
                        buy: false,
                        onTap: () {
                          setState(() {
                            deleteAction(state, index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            totalWidget(),
          ],
        ),
      ),
    );
  }

  void deleteAction(ShopState state, int index) {
    if (state is ShopPageLoadedState) {
      state.cartData!.listItems!.removeAt(index);
      calculateTotalAmount(listItems!);
      BlocProvider.of<ShopBloc>(context).add(
        ItemDeleteCartEvent(
          cartItems: state.cartData!.listItems!,
        ),
      );
    } else if (state is ItemAddedCartState) {
      state.cartItems!.removeAt(index);
      calculateTotalAmount(listItems!);
      BlocProvider.of<ShopBloc>(context).add(
        ItemDeleteCartEvent(
          cartItems: state.cartItems,
        ),
      );
    } else if (state is ItemDeletingCartState) {
      state.cartItems!.removeAt(index);
      calculateTotalAmount(listItems!);
      BlocProvider.of<ShopBloc>(context).add(
        ItemDeleteCartEvent(
          cartItems: state.cartItems,
        ),
      );
    }
  }

  Expanded totalWidget() {
    return Expanded(
      child: Container(
        height: totalH,
        width: totalW,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Total ${listItems!.length} item',
                  style: TextStyle(
                    color: onprimaryColor,
                  ),
                ),
                subtitle: Text(
                  'Rp. $totalAmount',
                  style: TextStyle(
                    color: onprimaryColor,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
