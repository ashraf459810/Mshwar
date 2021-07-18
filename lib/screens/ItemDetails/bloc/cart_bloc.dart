import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/cart/AddOrDelete.dart';
import 'package:dellyshop/models/cart/CartModel.dart';
import 'package:meta/meta.dart';
import 'package:dellyshop/injection.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());
  int cartcount = 0;
  AddOrDelete addOrDelete;
  CartModel cartModel;
  var repo = sl.get<IRepository>();
  String token;
  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartCountEvent) {
      cartcount++;
      yield CartCountState(cartcount);
      print("here after yield in bloc");
    }
    if (event is AddItemToCartEvent) {
      try {
        token = await repo.iprefsHelper.gettoken();
        print("$token ${event.itemid}  ${event.itemid} ");
        var response = await repo.iHttpHlper.getrequest(
            "/Cart/Add?api_token=$token&items_id=${event.itemid}&quantity=${event.count}&notes=");
        print(response.toString());
        AddOrDelete addOrDelete = addOrDeleteFromJson(response);

        yield AddItemToCartState(addOrDelete);
      } catch (error) {
        print(error);
        yield Error(error.toString());
      }
    }
    if (event is GetCartItemsEvent) {
      try {
        var response = await repo.iHttpHlper
            .getrequest("/Cart/GetFinancials?api_token=$token");
        cartModel = cartModelFromJson(response);
        yield GetCartItemsState(cartModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
