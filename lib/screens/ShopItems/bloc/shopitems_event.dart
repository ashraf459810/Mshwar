part of 'shopitems_bloc.dart';

@immutable
abstract class ShopitemsEvent {}

class GetItemsEvent extends ShopitemsEvent {
  final int shopid;
  GetItemsEvent(this.shopid);
}
