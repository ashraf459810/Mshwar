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
  final AddResponse addOrDelete;

  AddItemToCartState(this.addOrDelete);
}

class Error extends CartState {
  final String error;
  Error(this.error);
}

class Loading extends CartState {}

class RemoveFromCartState extends CartState {
  final CartModel cartModel;
  RemoveFromCartState(this.cartModel);
}

class GetAddressState extends CartState {
  final AddressModel addressModel;

  GetAddressState(this.addressModel);
}

class PlaceOrderState extends CartState {
  final PlaceOrderModel placeOrderModel;
  PlaceOrderState(this.placeOrderModel);
}
