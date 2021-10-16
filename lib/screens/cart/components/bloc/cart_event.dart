part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartCountEvent extends CartEvent {}

class AddItemToCartEvent extends CartEvent {
  final int itemid;
  final int count;
  final String attr;
  AddItemToCartEvent(this.count, this.itemid, this.attr);
}

class AddCustomOrderEvent extends CartEvent {
  final int shopId;
  final String note;

  AddCustomOrderEvent({this.shopId, this.note});
}

class GetCartItemsEventWithDefaultAddress extends CartEvent {
  final int addressId;

  GetCartItemsEventWithDefaultAddress(this.addressId);
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

class GetIsLoginEvent extends CartEvent {}
