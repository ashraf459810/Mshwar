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
  String selectedaddreddname;
  int selectedAddress;
  List<Address> address = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => GetlocationBloc()..add(GetAddressEvent()),
        child: BlocBuilder<GetlocationBloc, GetlocationState>(
            builder: (context, state) {
          if (state is RemoveAddressState) {
            address = state.removeAddressRespnose.addresses;
          }

          if (state is GetAddressState) {
            address = state.addressModel.addresses;
          }
          // if (state is Loading) {
          //   print("here loading");
          //   return Center(
          //     child: CircularProgressIndicator(
          //       color: Colors.orange,
          //     ),
          //   );
          // }

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
                              child: Center(child: Text("Remove")),
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
