import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freshbucket/model/product/product.dart';
import 'package:freshbucket/services/product/productservice.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ProductService productService = ProductService();
  ShopBloc() : super(ShopInitial());

  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    if (event is ShopPageInitializedEvent) {
      ProductData shopData = await productService.getProductItems();
      ProductData cartData = await productService.geCartItems();
      yield ShopPageLoadedState(
        shopData: shopData,
        cartData: cartData,
      );
    }
    if (event is ItemAddingCartEvent) {
      yield ItemAddingCartState(
        cartItems: event.cartItems,
      );
    }
    if (event is ItemAddedCartEvent) {
      yield ItemAddedCartState(
        cartItems: event.cartItems,
      );
    }
    if (event is ItemDeleteCartEvent) {
      yield ItemDeletingCartState(
        cartItems: event.cartItems,
      );
    }
  }
}
