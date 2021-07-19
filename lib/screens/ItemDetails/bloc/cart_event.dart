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

class RemoveItemFromCartEvent extends CartState {
  final itemid;
  RemoveItemFromCartEvent(this.itemid);
}
