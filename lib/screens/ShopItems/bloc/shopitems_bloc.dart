import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/ShopItem.dart';
import 'package:meta/meta.dart';
import 'package:dellyshop/injection.dart';
part 'shopitems_event.dart';
part 'shopitems_state.dart';

class ShopitemsBloc extends Bloc<ShopitemsEvent, ShopitemsState> {
  ShopitemsBloc() : super(ShopitemsInitial());

  var repo = sl.get<IRepository>();
  ShopItem shopItem;
  @override
  Stream<ShopitemsState> mapEventToState(
    ShopitemsEvent event,
  ) async* {
    if (event is GetItemsEvent) {
      yield Loading();
      try {
        print("here");
        var response = await repo.iHttpHlper.getrequest(
            "/Items?title=&description=&quantity=&shops_id=${event.shopid}&orderBy=&orderDir=&results_num=");
        shopItem = shopItemFromJson(response);
        yield GetItemsState(shopItem);
      } catch (error) {
        print(error);
        yield Error(error);
      }
    }
  }
}
