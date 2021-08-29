import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/ShopCategories/ShopCategories.dart';
import 'package:dellyshop/models/ShopItem.dart';
import 'package:meta/meta.dart';
import 'package:dellyshop/injection.dart';
part 'shopitems_event.dart';
part 'shopitems_state.dart';

class ShopitemsBloc extends Bloc<ShopitemsEvent, ShopitemsState> {
  ShopitemsBloc() : super(ShopitemsInitial());
  List<Datum> items = [];
  var repo = sl.get<IRepository>();
  ShopCategories shopItem;
  @override
  Stream<ShopitemsState> mapEventToState(
    ShopitemsEvent event,
  ) async* {
    if (event is GetItemsEvent) {
      yield Loading();
      try {
        print("here");
        var response =
            await repo.iHttpHlper.getrequest("/Shops/${event.shopid}");
        shopItem = shopCategoriesFromJson(response);
        // for (var i = 0; i < shopItem.items.data.length; i++) {
        //   if (items.length < shopItem.items.data.length) {
        //     items.add(shopItem.items.data[i]);
        //   } else {}
        // }
        yield GetItemsState(shopItem.shopCategories);
      } catch (error) {
        print(error);
        yield Error(error);
      }
    }
  }
}
