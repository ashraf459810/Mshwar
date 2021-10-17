import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart';

import 'package:dellyshop/screens/add_adress/components/GetLocationBloc/getlocation_bloc.dart';

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
  String selectaddress = "select address";
  String selectedaddreddname;
  int selectedAddress;
  List<Address> address = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => GetlocationBloc()..add(GetAddressEvent()),
        child: BlocConsumer<GetlocationBloc, GetlocationState>(
            listener: (context, state) {
          if (state is RemoveAddressState) {
            address = state.removeAddressRespnose.addresses;
            Toast.show(
                ApplicationLocalizations.of(context)
                    .translate("Address Removed"),
                context,
                backgroundColor: Colors.orange[900]);
            selectedaddreddname = null;
          }

          if (state is GetAddressState) {
            address = state.addressModel.addresses;
          }
          if (state is Error) {
            return Scaffold(
              body: Center(
                child: Container(
                  child: Text(
                    state.error,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          }
        }, builder: (context, state) {
          if (state is GetlocationInitial) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
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
                            ApplicationLocalizations.of(context)
                                .translate("Select Addrress To Delete"),
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
                                  ? Text(selectaddress == "select address"
                                      ? ApplicationLocalizations.of(context)
                                          .translate(selectaddress)
                                      : selectaddress)
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
                          Builder(
                            builder: (context) => GestureDetector(
                              onTap: () {
                                context
                                    .read<GetlocationBloc>()
                                    .add(RemoveAddressEvent(selectedAddress));
                              },
                              child: Container(
                                height: h(50),
                                width: w(300),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(30),
                                    color: kAppColor),
                                child: Center(
                                    child: Text(
                                        ApplicationLocalizations.of(context)
                                            .translate("remove"))),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                          child: Text(
                        ApplicationLocalizations.of(context)
                            .translate("No addresses added for you"),
                        style: TextStyle(
                            color: kAppColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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
