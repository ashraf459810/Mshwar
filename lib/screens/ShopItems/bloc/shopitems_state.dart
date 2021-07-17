part of 'shopitems_bloc.dart';

@immutable
abstract class ShopitemsState {}

class ShopitemsInitial extends ShopitemsState {}

class Loading extends ShopitemsState {}

class Error extends ShopitemsState {
  final String error;
  Error(this.error);
}

class GetItemsState extends ShopitemsState {
  final ShopItem shopItem;
  GetItemsState(this.shopItem);
}
