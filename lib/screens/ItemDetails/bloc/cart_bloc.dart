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

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartCountEvent) {
      print("here from event");
      cartcount = await repo.iprefsHelper.getcartcount();
      yield CartCountState(cartcount);
      print("here after state");
    }
    if (event is AddItemToCartEvent) {
      print("${repo.iprefsHelper.gettoken()}");
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper.getrequest(
            "/Cart/Add?api_token=$token&items_id=${event.itemid}&quantity=${event.count}&notes=");

        AddOrDelete addOrDelete = addOrDeleteFromJson(response);
        await repo.iprefsHelper.increasecartcount();

        yield AddItemToCartState(addOrDelete);
        add(CartCountEvent());
      } catch (error) {
        print(error);
        yield Error(error.toString());
      }
    }
    if (event is GetCartItemsEvent) {
      yield Loading();
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper
            .getrequest("/Cart/GetFinancials?api_token=$token");
        cartModel = cartModelFromJson(response);
        yield GetCartItemsState(cartModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is RemoveItemFromCartEvent) {
      yield Loading();
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper
            .getrequest("/Cart/Remove/{carts_id}?api_token=$token");

        AddOrDelete addOrDelete = addOrDeleteFromJson(response);
        await repo.iprefsHelper.increasecartcount();

        yield AddItemToCartState(addOrDelete);
        add(CartCountEvent());
      } catch (error) {
        yield Error(error);
      }
    }
  }
}
