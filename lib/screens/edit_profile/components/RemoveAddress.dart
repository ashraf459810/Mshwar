import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart';
import 'package:dellyshop/screens/ItemDetails/bloc/cart_bloc.dart';
import 'package:dellyshop/screens/add_adress/components/GetLocationBloc/getlocation_bloc.dart'
    as loc;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class RemoveAddress extends StatefulWidget {
  RemoveAddress({Key key}) : super(key: key);

  @override
  _RemoveAddressState createState() => _RemoveAddressState();
}

class _RemoveAddressState extends State<RemoveAddress> {
  loc.GetlocationBloc getlocationBlocc = loc.GetlocationBloc();
  String selectedaddreddname;
  int selectedAddress;
  List<Address> address = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => CartBloc()..add(GetAddressEvent()),
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is GetAddressState) {
            address = state.addressModel.addresses;
          }
          if (state is Loading) {
            print("here loading");
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }

          if (state is Error) {
            return Text(
              state.error,
              style: TextStyle(color: Colors.black),
            );
          }
          return Scaffold(
              body: address.isNotEmpty
                  ? Container(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Select Addrress To Delete",
                            style: TextStyle(color: kAppColor, fontSize: 16),
                          ),
                          SizedBox(
                            height: h(50),
                          ),
                          Container(
                            height: h(50),
                            width: w(300),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                borderRadius: BorderRadius.circular(30)),
                            child: DropdownButton<Address>(
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: selectedaddreddname == null
                                  ? Text("    select address")
                                  : Text("     $selectedaddreddname"),
                              items: address.map((Address value) {
                                return DropdownMenuItem<Address>(
                                  value: value,
                                  child: new Text(value.name),
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(selectedAddress);
                                selectedaddreddname = value.name;
                                selectedAddress = value.id;
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            height: h(40),
                          ),
                          GestureDetector(
                            onTap: () {
                              getlocationBlocc
                                  .add(loc.RemoveAddressEvent(selectedAddress));
                              context.read<CartBloc>().add(GetAddressEvent());
                            },
                            child: BlocListener(
                              bloc: getlocationBlocc,
                              listener: (context, state) {
                                if (state is loc.RemoveAddressState) {
                                  Toast.show("Removed Successfully", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.TOP,
                                      backgroundColor: Colors.orange[900]);
                                }
                              },
                              child: Container(
                                height: h(50),
                                width: w(300),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(30),
                                    color: kAppColor),
                                child: Center(child: Text("Remove")),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                          child: Text(
                        "No addresses added for you",
                        style: TextStyle(color: kAppColor),
                      )),
                    ));
        }));
  }

  double h(double h) {
    return ScreenUtil().setHeight(h);
  }

  double w(double w) {
    return ScreenUtil().setWidth(w);
  }
}
