import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshbucket/bloc/navbar/navbar_bloc.dart';
import 'package:freshbucket/view/home/homeview.dart';
import 'package:freshbucket/view/product/cartview.dart';
import 'package:freshbucket/view/user/userview.dart';
import 'package:freshbucket/view/utils/common/topbarwidget.dart';
import 'package:freshbucket/view/utils/constant.dart';

class ScaffoldWidget extends StatelessWidget {
  NavbarBloc? navbarBloc = NavbarBloc();

  TopBarWidget? topBarWidget;
  Widget? body;
  int currentIndex = 0;

  ScaffoldWidget({
    Key? key,
    this.topBarWidget,
    this.body,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: navbarBloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is ShowCart) {
          return CartView();
        }
        if (state is ShowUser) {
          return UserView();
        }
        if (state is ShowHome) {
          return HomeView();
        }

        return buildHomepage();
      },
    );
  }

  Scaffold buildHomepage() {
    return Scaffold(
        appBar: topBarWidget,
        body: body,
        backgroundColor: bgColor,
        bottomNavigationBar: buildNavBar(currentIndex));
  }

  BottomNavigationBar buildNavBar(currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) navbarBloc!.add(NavbarEvent.ShowHome);
        if (index == 1) navbarBloc!.add(NavbarEvent.ShowCart);
        if (index == 2) navbarBloc!.add(NavbarEvent.ShowUser);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          activeIcon: Icon(Icons.home, color: primaryColor),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          activeIcon: Icon(Icons.shopping_cart, color: primaryColor),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          activeIcon: Icon(Icons.person, color: primaryColor),
          label: '',
        )
      ],
    );
  }
}
