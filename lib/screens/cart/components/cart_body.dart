import 'package:dellyshop/Widgets%20copy/Text.dart';
import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart';
import 'package:dellyshop/models/CartModel.dart';

import 'package:dellyshop/screens/add_adress/components/DeliverLocation.dart';
import 'package:dellyshop/screens/cart/components/bloc/cart_bloc.dart';

import 'package:dellyshop/screens/payment/components/payment_body.dart';

import 'package:dellyshop/widgets/card_widget.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';

import 'package:dellyshop/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import '../../../util.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  ScrollController scrollController = ScrollController();
  String selectaddress = 'select address';
  Address chosenaddress;
  int addressid;
  var selectedUser;
  CartModel cartModel;
  double totalListHeight;
  double itemHeight = h(120);
  int index = 1;
  int value = 2;
  int pay = 200;
  int defaultAddressId;
  List<Cart> cartOrdinaryAndCustom = [];

  List<Address> address = [];

  @override
  void initState() {
    context.read<CartBloc>().add(GetAddressEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
    totalListHeight = ((index * itemHeight)).toDouble();

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is GetAddressState) {
          address = state.addressModel.addresses;

          if (state.addressModel.addresses.isEmpty) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DelieverLocation(),
            ));
          }
          defaultAddressId = state.addressModel.addresses[0].id;
        }
      },
      builder: (context, state) {
        if (state is GetAddressState) {
          address = state.addressModel.addresses;
          context
              .read<CartBloc>()
              .add(GetCartItemsEventWithDefaultAddress(defaultAddressId));

          print(address.length);
          return CircularProgressIndicator();
        }
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        }
        if (state is GetCartItemsState) {
          cartModel = state.cartModel;
          cartOrdinaryAndCustom = cartModel.carts;
          Cart customCart;
          for (var i = 0; i < cartModel.customCarts.length; i++) {
            customCart = Cart(
                id: cartModel.customCarts[i].id,
                notes: cartModel.customCarts[i].notes,
                quantity: 1,
                total: 0);
            cartOrdinaryAndCustom.add(customCart);
          }
        }
        if (state is RemoveFromCartState) {
          print(cartModel.carts.length);

          cartModel = state.cartModel;
          context.read<CartBloc>().add(CartCountEvent());
        }
        if (state is Error) {
          return Text(
            state.error,
            style: TextStyle(color: Colors.black),
          );
        }
        return cartOrdinaryAndCustom.isNotEmpty
            ? Container(
                margin: EdgeInsets.all(10.0),
                child: cartModel.carts.isNotEmpty
                    ? ListView(
                        children: [
                          //Product List
                          SizedBox(
                            height: h(400),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    // color: Colors.black,
                                    height: itemHeight * 1.3,
                                    child: cartProductItem(index),
                                  ),
                                );
                              },
                              itemCount: cartModel.carts.length,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 1.0,
                              color: kLightBlackTextColor.withOpacity(0.3),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardWidget(
                            childWidget: FractionalTranslation(
                              translation: Offset(0.0, -0.1),
                              child: ListTile(
                                title: Text(
                                  ApplicationLocalizations.of(context)
                                      .translate("shipping_cost"),
                                  style: TextStyle(
                                      color: Utils.isDarkMode
                                          ? kDarkBlackTextColor
                                          : kLightBlackTextColor),
                                ),
                                subtitle: Text(
                                  "",
                                ),
                                trailing: Text(
                                  "${cartModel.deliveryFees}",
                                  style: TextStyle(
                                      color: kAppColor,
                                      fontSize: kPriceFontSize),
                                ),
                                leading: Container(
                                  child: Icon(
                                    Icons.local_shipping,
                                    size: 35,
                                    color: kAppColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h(10),
                          ),
                          CardWidget(
                            childWidget: ListTile(
                              title: Text(
                                ApplicationLocalizations.of(context)
                                    .translate("total_price"),
                                style: TextStyle(
                                    color: Utils.isDarkMode
                                        ? kDarkBlackTextColor
                                        : kLightBlackTextColor),
                              ),
                              trailing: Text(
                                "${cartModel.cartsTotal}",
                                style: TextStyle(
                                    color: kAppColor, fontSize: kPriceFontSize),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: TextWidget(
                                ApplicationLocalizations.of(context)
                                    .translate("select_address"),
                                kAppColor),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              address.isNotEmpty
                                  ? Container(
                                      height: h(47),
                                      width: w(150),
                                      child: CardWidget(
                                        childWidget: DropdownButton<Address>(
                                          hint: Center(
                                              child: Text(
                                            selectaddress == "select address"
                                                ? ApplicationLocalizations.of(
                                                        context)
                                                    .translate(selectaddress)
                                                : selectaddress,
                                            style: TextStyle(
                                                color: kTextColorColor,
                                                fontWeight: FontWeight.w400),
                                          )),
                                          value: chosenaddress,
                                          isExpanded: true,
                                          iconSize: 24,
                                          elevation: 16,

                                          // style: const TextStyle(color: Colors.deepPurple),

                                          underline: SizedBox(),
                                          onChanged: (Address newValue) {
                                            setState(() {
                                              selectaddress = newValue.name;
                                              addressid = newValue.id;
                                              context.read<CartBloc>().add(
                                                  GetCartItemsEventWithDefaultAddress(
                                                      addressid));
                                            });
                                          },

                                          items: address
                                              .map<DropdownMenuItem<Address>>(
                                                  (Address value) {
                                            return DropdownMenuItem<Address>(
                                              value: value,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(value.name),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )
                                  : address.isEmpty
                                      ? ShimmerWidget(
                                          child: Container(
                                            height: h(30),
                                            color: Colors.grey,
                                          ),
                                        )
                                      : state is GetAddressState &&
                                              address.isEmpty
                                          ? Container(
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Add Address please",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .orange[900],
                                                          fontSize: 15),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.grey,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Container(
                                                color: Colors.black,
                                                child: text(
                                                    text: "You cart is empty",
                                                    color: Colors.orange[900]),
                                              ),
                                            ),
                              CardWidget(
                                  childWidget: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DelieverLocation(
                                            f: () {
                                              Navigator.of(context).pop();
                                              print("here from the fun");
                                              context
                                                  .read<CartBloc>()
                                                  .add(GetAddressEvent());
                                            },
                                          )));
                                },
                                child: Row(
                                  children: [
                                    TextWidget(
                                        ApplicationLocalizations.of(context)
                                            .translate("add_address"),
                                        Utils.isDarkMode
                                            ? kDarkTextColorColor
                                            : kLightBlackTextColor),
                                    Icon(
                                      Icons.add,
                                      color: kAppColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                              )),
                            ],
                          )
                          // : ShimmerWidget(
                          //     child: Container(
                          //       height: h(50),
                          //       width: w(50),
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.rectangle,
                          //         borderRadius: BorderRadius.all(
                          //             Radius.circular(30)),
                          //         color: Colors.grey[300],
                          //       ),
                          //     ),
                          //   ),
                          ,
                          SizedBox(
                            height: h(20),
                          ),
                          ButtonCustom(
                            txt: ApplicationLocalizations.of(context)
                                .translate("select payment method"),
                            ontap: () {
                              addressid != null
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PaymentBody(addressid)))
                                  : Toast.show(
                                      ApplicationLocalizations.of(context)
                                          .translate(
                                              "Please Select Address first"),
                                      context,
                                      duration: 2,
                                      gravity: 2,
                                      backgroundColor: Colors.orange[900]);
                            },
                            bacgroudColor: kAppColor,
                            textColor: kWhiteColor,
                          )
                        ],
                      )
                    : Container(),
              )
            : Container(
                child: Center(
                  child: Text(
                    ApplicationLocalizations.of(context)
                        .translate("No Items In your cart"),
                    style: TextStyle(color: Colors.orange[900], fontSize: 18),
                  ),
                ),
              );
      },
    );
  }

  cartProductItem(int index) {
    return Builder(
      builder: (context) => Dismissible(
        onDismissed: (val) {
          context
              .read<CartBloc>()
              .add(RemoveItemFromCartEvent(cartModel.carts[index].id));
        },
        background: slideRightBackground(),
        secondaryBackground: slideLeftBackground(),
        key: UniqueKey(),
        child: CardWidget(
          height: h(200),
          childWidget: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cartOrdinaryAndCustom[index].isCustom == 0
                      ? Image.network(
                          "${cartOrdinaryAndCustom[index].items.images.split(",").first}",
                          fit: BoxFit.cover,
                        )
                      : Image.asset("assets/images/customorder.png")),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        cartOrdinaryAndCustom[index].isCustom == 0
                            ? ApplicationLocalizations.of(context)
                                        .appLocale
                                        .languageCode ==
                                    "en"
                                ? "${cartModel.carts[index].items.titleEn.toString()}"
                                : "${cartModel.carts[index].items.title.toString()}"
                            : cartOrdinaryAndCustom[index].notes,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Utils.isDarkMode
                                ? kDarkBlackTextColor
                                : kLightBlackTextColor,
                            fontSize: kTitleFontSize)),
                    Text(
                        cartOrdinaryAndCustom[index].isCustom == 0
                            ? ApplicationLocalizations.of(context)
                                        .appLocale
                                        .languageCode ==
                                    "en"
                                ? "${cartModel.carts[index].items.descriptionEn}"
                                : "${cartModel.carts[index].items.description.toString()}"
                            : "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Utils.isDarkMode
                                ? kDarkTextColorColor
                                : kGrayColor,
                            fontSize: kSmallFontSize)),
                    SizedBox(
                      height: h(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartOrdinaryAndCustom[index].isCustom == 0
                              ? "${cartModel.carts[index].items.price}"
                              : "",
                          style: TextStyle(
                              color: kAppColor, fontSize: kPriceFontSize),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, right: 10.0),
                          child: Container(
                            width: w(112),
                            decoration: BoxDecoration(
                              color: Utils.isDarkMode
                                  ? kDarkGrayColor
                                  : kWhiteColor,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.black12.withOpacity(0.1),
                                ),
                                bottom: BorderSide(
                                  color: Colors.black12.withOpacity(0.1),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                /// Decrease of value item

                                // Builder(
                                //   builder: (context) => InkWell(
                                //     onTap: () {
                                //       context.read<CartBloc>().add(
                                //           RemoveItemFromCartEvent(
                                //               cartModel.carts[index].id));
                                //     },
                                //     child:
                                Container(
                                    height: h(30),
                                    width: w(30),
                                    decoration: BoxDecoration(
                                      color: kAppColor.withOpacity(0.7),
                                      border: Border(
                                          right: BorderSide(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                          ),
                                          left: BorderSide(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                          )),
                                    )),
                                //       child: Center(
                                //           child: Text(
                                //         "--",
                                //         style: TextStyle(
                                //             color: Colors.white, fontSize: 15),
                                //       )),
                                //     ),
                                //   ),
                                // ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Text(
                                    "${cartModel.carts[index].quantity}",
                                    style: TextStyle(
                                        color: Utils.isDarkMode
                                            ? kDarkTextColorColor
                                            : kTextColorColor),
                                  ),
                                ),

                                Container(
                                  height: h(30),
                                  width: w(28.0),
                                  decoration: BoxDecoration(
                                      color: kAppColor.withOpacity(0.7),
                                      border: Border(
                                          left: BorderSide(
                                              color: Colors.black12
                                                  .withOpacity(0.1)))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h(4),
                    ),
                    attributes(index)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.red,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: w(20),
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              ApplicationLocalizations.of(context).translate("delete"),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.red,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  Widget attributes(int index) {
    return Container(
      height: h(30),
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: cartModel.carts[index].customAttributesValues.length,
        itemBuilder: (context, index2) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              cartModel.carts[index].customAttributesValues[index2].name
                  .toString(),
              style: TextStyle(color: Colors.orange[900], fontSize: 15),
            ),
          );
        },
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
