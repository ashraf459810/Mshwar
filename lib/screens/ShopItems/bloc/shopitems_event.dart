part of 'shopitems_bloc.dart';

@immutable
abstract class ShopitemsEvent {}

class GetItemsEvent extends ShopitemsEvent {
  final int shopid;
  final int page;
  final int size;
  GetItemsEvent(this.shopid, this.page, this.size);
}
