part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartCountEvent extends CartEvent {}

class AddItemToCartEvent extends CartEvent {
  final int itemid;
  final int count;
  AddItemToCartEvent(
    this.count,
    this.itemid,
  );
}

class GetCartItemsEvent extends CartEvent {}

class RemoveItemFromCartEvent extends CartEvent {
  final int itemid;
  RemoveItemFromCartEvent(this.itemid);
}

class GetAddressEvent extends CartEvent {}

class PlaceOrderEvent extends CartEvent {
  final int addressid;
  final bool iscash;
  PlaceOrderEvent(this.addressid, this.iscash);
}
