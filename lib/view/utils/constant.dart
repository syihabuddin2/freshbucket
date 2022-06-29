import 'package:flutter/material.dart';

late double statusBarHeight;
late double heightSize, widthSize;
late double shortestSide;
late bool isMobile;
late Orientation orientation;

///Common
late double txtHeight;
late double txtWidth;

///Home
late double homeHeight,
    homeHeaderH,
    homeSearchH,
    homeUserImgH,
    listItemH,
    categoryH;

late double homeWidth,
    homeHeaderW,
    homeSearchW,
    homeUserImgW,
    listItemW,
    categoryW;

///Cart
late double cartH, listCartH, totalH, quantityH;
late double cartW, listCartW, totalW, quantityW;

///User
late double profilHeight, imgHeight, nameHeight;
late double profilWidth, imgWidth, nameWidth;

responsiveLayout(Orientation orientation) {
  if (orientation == Orientation.portrait) {
    if (isMobile) {
      print('potrait mobile');

      ///Common
      txtHeight = heightSize * 0.04;
      txtWidth = widthSize * 0.90;

      ///Home
      homeHeight = heightSize * 1.0;
      homeWidth = widthSize * 1.0;
      homeHeaderH = homeHeight * 0.19;
      homeHeaderW = homeWidth * 1.0;
      homeUserImgH = homeHeaderH * 0.40;
      homeUserImgW = homeHeaderW * 0.29;
      homeSearchH = homeHeight * 0.10;
      homeSearchW = homeWidth * 1.0;
      listItemH = homeHeight * 0.532;
      listItemW = homeWidth * 1.0;

      ///Cart
      cartH = heightSize * 1.0;
      cartW = widthSize * 1.0;
      listCartH = cartH * 0.61;
      listCartW = cartW * 1.0;
      totalH = cartH * 0.09;
      totalW = cartW * 1.0;
      quantityH = listCartH * 0.05;
      quantityW = listCartW * 0.05;

      ///User
      profilHeight = heightSize * 1.0;
      profilWidth = widthSize * 1.0;
      imgHeight = profilHeight * 0.20;
      imgWidth = profilWidth * 1.0;
      nameHeight = profilHeight * 0.07;
      nameWidth = profilWidth * 1.0;
    } else {
      print('potrait tablet');

      ///User
      txtHeight = heightSize * 0.05;
      txtWidth = widthSize * 0.20;
    }
  } else {
    if (isMobile) {
      ///Common
      txtHeight = heightSize * 0.04;
      txtWidth = widthSize * 0.90;

      ///Home
      homeHeight = heightSize * 1.0;
      homeWidth = widthSize * 1.0;
      homeHeaderH = homeHeight * 0.19;
      homeHeaderW = homeWidth * 1.0;
      homeUserImgH = homeHeaderH * 0.40;
      homeUserImgW = homeHeaderW * 0.29;
      homeSearchH = homeHeight * 0.10;
      homeSearchW = homeWidth * 1.0;
      listItemH = homeHeight * 0.532;
      listItemW = homeWidth * 1.0;

      ///Cart
      cartH = heightSize * 1.0;
      cartW = widthSize * 1.0;
      listCartH = cartH * 0.61;
      listCartW = cartW * 1.0;
      totalH = cartH * 0.09;
      totalW = cartW * 1.0;
      quantityH = listCartH * 0.05;
      quantityW = listCartW * 0.05;

      ///User
      profilHeight = heightSize * 1.0;
      profilWidth = widthSize * 1.0;
      imgHeight = profilHeight * 0.20;
      imgWidth = profilWidth * 1.0;
      nameHeight = profilHeight * 0.07;
      nameWidth = profilWidth * 1.0;
    } else {
      print('landscape tablet');

      ///User
      txtHeight = heightSize * 0.10;
      txtWidth = widthSize * 0.90;
    }
  }
}

///Color
var primaryColor = Color(0xFF1EA050);
var onprimaryColor = Colors.white;
var bgColor = Color(0xFFFFFFFF);
var txtColor = Color(0xFF04021D);
var txt2Color = Color(0xFF808080);
var txt3Color = Color(0xFF686777);
