import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshbucket/bloc/shop/shop_bloc.dart';
import 'package:freshbucket/bloc/user/user_bloc.dart';
import 'package:freshbucket/model/product/product.dart';
import 'package:freshbucket/view/product/productitem.dart';
import 'package:freshbucket/view/utils/common/scaffoldwidget.dart';
import 'package:freshbucket/view/utils/common/textfieldwidget.dart';
import 'package:freshbucket/view/utils/common/textwidget.dart';
import 'package:freshbucket/view/utils/constant.dart';

class HomeView extends StatelessWidget {
  List<ProductItem>? _cartItems = [];
  List<ProductItem>? shopItems;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return ScaffoldWidget(
      body: body(context, orientation),
      currentIndex: 0,
    );
  }

  body(context, Orientation orientation) {
    ///Responsive layout
    responsiveLayout(orientation);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: homeHeight,
        width: homeWidth,
        child: Column(
          children: [
            headerWidget(),
            searchWidget(),
            listWidget(),
          ],
        ),
      ),
    );
  }

  Container headerWidget() {
    return Container(
      height: homeHeaderH,
      width: homeHeaderW,
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                TextWidget(
                  txtHeight: txtHeight,
                  scale: 0.80,
                  mainAxis: MainAxisAlignment.center,
                  fontWeight: FontWeight.normal,
                  label: 'Find',
                  color: Colors.orange,
                ),
                TextWidget(
                  txtHeight: txtHeight,
                  scale: 0.80,
                  mainAxis: MainAxisAlignment.center,
                  fontWeight: FontWeight.normal,
                  label: ' Fresh Groceries',
                  color: primaryColor,
                ),
              ],
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is GetUserSuccess) {
                var userPicture = state.user!.results![0].picture!.large;

                return Expanded(
                  child: Container(
                    height: homeUserImgH,
                    width: homeUserImgW,
                    margin: EdgeInsets.only(left: homeUserImgH * 0.70),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.network('${userPicture}').image,
                        fit: BoxFit.contain,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }
              return Expanded(
                child: Container(
                  height: homeUserImgH,
                  width: homeUserImgW,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container searchWidget() {
    return Container(
      height: homeSearchH,
      width: homeSearchW,
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              txtHeight: homeSearchH,
              txtWidth: homeSearchW,
              //txtController: searchController,
              prefixIcon: Icon(
                Icons.search,
                color: primaryColor,
              ),
              label: 'Search Groceries',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container listWidget() {
    return Container(
      //color: Colors.red,
      height: listItemH,
      width: listItemW,
      child: Column(
        children: [
          TextWidget(
            txtHeight: txtHeight,
            scale: 0.54,
            mainAxis: MainAxisAlignment.start,
            fontWeight: FontWeight.bold,
            label: 'Categories',
            color: txtColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            //color: Colors.purple,
            height: listItemH * 0.902,
            width: listItemW,
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    //color: Colors.yellow,
                    height: listItemH * 0.10,
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                      ),
                      tabs: const [
                        Tab(text: 'Apple'),
                        Tab(text: 'Orange'),
                        Tab(text: 'Banana'),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.blue,
                    height: listItemH * 0.792,
                    margin: EdgeInsets.only(top: listItemH * 0.01),
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: BlocBuilder<ShopBloc, ShopState>(
                            builder: (context, state) {
                              if (state is ShopPageLoadedState) {
                                var data = state.shopData!.listItems!;
                                var cart = state.cartData!.listItems!;
                                return appleList(data, cart);
                              }

                              return ListView();
                            },
                          ),
                        ),
                        Center(
                          child: BlocBuilder<ShopBloc, ShopState>(
                            builder: (context, state) {
                              if (state is ShopPageLoadedState) {
                                var data = state.shopData!.listItems!;
                                var cart = state.cartData!.listItems!;
                                return orangeList(data, cart);
                              }

                              return ListView();
                            },
                          ),
                        ),
                        Center(
                          child: BlocBuilder<ShopBloc, ShopState>(
                            builder: (context, state) {
                              if (state is ShopPageLoadedState) {
                                var data = state.shopData!.listItems!;
                                var cart = state.cartData!.listItems!;
                                return bananaList(data, cart);
                              }

                              return ListView();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView appleList(List<ProductItem> data, List<ProductItem> cart) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (data.elementAt(index).category == 'Apple') {
          return Column(
            children: [
              ProductItemWidget(
                fruitImgPath: data.elementAt(index).fruitImg,
                title: data.elementAt(index).title,
                price: data.elementAt(index).price,
                buy: true,
                onTap: () {
                  cart.add(data[index]);
                  print('cart: ${cart.length}');
                },
              ),
            ],
          );
        }

        return Column();
      },
    );
  }

  ListView orangeList(List<ProductItem> data, List<ProductItem> cart) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (data.elementAt(index).category == 'Orange') {
          return Column(
            children: [
              ProductItemWidget(
                fruitImgPath: data.elementAt(index).fruitImg,
                title: data.elementAt(index).title,
                price: data.elementAt(index).price,
                buy: true,
                onTap: () {
                  cart.add(data[index]);
                  print('cart: ${cart.length}');
                },
              ),
            ],
          );
        }

        return Column();
      },
    );
  }

  ListView bananaList(List<ProductItem> data, List<ProductItem> cart) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (data.elementAt(index).category == 'Banana') {
          return Column(
            children: [
              ProductItemWidget(
                fruitImgPath: data.elementAt(index).fruitImg,
                title: data.elementAt(index).title,
                price: data.elementAt(index).price,
                buy: true,
                onTap: () {
                  cart.add(data[index]);
                  print('cart: ${cart.length}');
                },
              ),
            ],
          );
        }

        return Column();
      },
    );
  }
}
