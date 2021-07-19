part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartCountState extends CartState {
  final count;
  CartCountState(this.count);
}

class GetCartItemsState extends CartState {
  final CartModel cartModel;
  GetCartItemsState(this.cartModel);
}

class AddItemToCartState extends CartState {
  final AddOrDelete addOrDelete;

  AddItemToCartState(this.addOrDelete);
}

class Error extends CartState {
  final String error;
  Error(this.error);
}

class Loading extends CartState {}

class RemoveFromCartState extends CartState {
  final AddOrDelete addOrDelete;
  RemoveFromCartState(this.addOrDelete);
}
