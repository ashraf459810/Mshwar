import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart';
import 'package:dellyshop/models/AddOrDelete.dart';
import 'package:dellyshop/models/CartHistory/CartHistory.dart';
import 'package:dellyshop/models/CartModel.dart';
import 'package:dellyshop/models/PlaceOrderModel.dart';

import 'package:meta/meta.dart';
import 'package:dellyshop/injection.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());
  int cartcount = 0;
  AddResponse addOrDelete;
  CartModel cartModel;
  PlaceOrderModel placeOrderModel;
  int payid;
  var repo = sl.get<IRepository>();
  AddressModel addressModel;
  CartHistory cartHistory;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartCountEvent) {
      print("here from cart count event");
      cartcount = await repo.iprefsHelper.getcartcount();
      yield CartCountState(cartcount);
      // add(GetIsLoginEvent());
    }
    if (event is AddCustomOrderEvent) {
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper.getrequest(
            "/Cart/Add?shops_id=${event.shopId}&isCustom=1&notes=${event.note}&api_token=$token");
      } catch (error) {
        print(error);
        yield Error(error.toString());
      }
    }
    if (event is AddItemToCartEvent) {
      print("${repo.iprefsHelper.gettoken()}");
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper.getrequest(
            "/Cart/Add?api_token=$token&items_id=${event.itemid}&quantity=${event.count}&notes=&attributes=${event.attr}");

        AddResponse addOrDelete = addOrDeleteFromJson(response);
        await repo.iprefsHelper.increasecartcount();
        add(GetCartItemsEvent());
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
        // add(GetAddressEvent());
      } catch (error) {
        print(" $error");
        yield Error("Error while getting items");
      }
    }
    if (event is GetCartItemsEventWithDefaultAddress) {
      yield Loading();
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper.getrequest(
            "/Cart/GetFinancials?api_token=$token&address_id=${event.addressId}");

        cartModel = cartModelFromJson(response);
        yield GetCartItemsState(cartModel);
      } catch (error) {
        yield Error("Error while getting items");
      }
    }
    if (event is RemoveItemFromCartEvent) {
      yield Loading();
      try {
        String token = await repo.iprefsHelper.gettoken();

        var response = await repo.iHttpHlper
            .getrequest("/Cart/Remove/${event.itemid}?api_token=$token");

        cartModel = cartModelFromJson(response);
        await repo.iprefsHelper.decreasecartcount();

        yield RemoveFromCartState(cartModel);
        // add(GetCartItemsEvent());
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is GetAddressEvent) {
      try {
        yield Loading();
        String token = await repo.iprefsHelper.gettoken();
        var response =
            await repo.iHttpHlper.getrequest("/Addresses?api_token=$token");
        addressModel = addressModelFromJson(response);

        yield GetAddressState(addressModel);
      } catch (error) {
        yield Error("Error while getting address");
      }
    }
    if (event is PlaceOrderEvent) {
      try {
        if (event.iscash == true) {
          payid = 1;
        } else {
          payid = 2;
        }
        String token = await repo.iprefsHelper.gettoken();
        var response = await repo.iHttpHlper.getrequest(
            "/Orders/PlaceOrder?addresses_id=${event.addressid}&api_token=$token&payment_methods_id=$payid&promoCode=");
        placeOrderModel = placeOrderModelFromJson(response);
        if (placeOrderModel.azsvr == "SUCCESS") print("success");
        yield PlaceOrderState(placeOrderModel);
        print("yielded");
      } catch (error) {
        yield Error("Error");
      }
    }
    // if (event is GetIsLoginEvent) {
    //   var islogin = await repo.iprefsHelper.getislogin();
    //   print("$islogin here from the bloc");
    //   yield GetIsLoginState(islogin);
    // }
  }
}
