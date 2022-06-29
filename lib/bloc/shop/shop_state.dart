part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopPageLoadedState extends ShopState {
  ProductData? shopData;
  ProductData? cartData;

  ShopPageLoadedState({this.cartData, this.shopData});
}

class ItemAddingCartState extends ShopState {
  ProductData? cartData;
  List<ProductItem>? cartItems;

  ItemAddingCartState({this.cartData, this.cartItems});
}

class ItemAddedCartState extends ShopState {
  List<ProductItem>? cartItems;

  ItemAddedCartState({this.cartItems});
}

class ItemDeletingCartState extends ShopState {
  List<ProductItem>? cartItems;

  ItemDeletingCartState({this.cartItems});
}
