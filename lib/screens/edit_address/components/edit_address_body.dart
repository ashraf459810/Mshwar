import 'package:dellyshop/models/address_model.dart';
import 'package:dellyshop/widgets/custom_drop_down_button.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class EditAddressBody extends StatefulWidget {
  final Address address;
  EditAddressBody(this.address);
  @override
  _EditAddressBodyState createState() => _EditAddressBodyState();
}

class _EditAddressBodyState extends State<EditAddressBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          CustomTextFromField(
            height: 60.0,
            icon: Icons.location_city,
            ispassword: false,
            placeHolder: widget.address.addressName,
            inputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          CustomTextFromField(
            height: 60.0,
            icon: Icons.pin_drop,
            ispassword: false,
            placeHolder: widget.address.addressPinCode,
            inputType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
          ),
          SizedBox(height: 20),
          CustomDropDownButton(
            dropDownButtonItems:
                addressList.map((e) => e.selectCountry).toList(),
            placeHolder: widget.address.selectCountry,
          ),
          SizedBox(height: 20),
          CustomDropDownButton(
            dropDownButtonItems: addressList.map((e) => e.selectCity).toList(),
            placeHolder: widget.address.selectCity,
          ),
          SizedBox(height: 20),
          CustomDropDownButton(
            dropDownButtonItems:
                addressList.map((e) => e.selectStreet).toList(),
            placeHolder: widget.address.selectStreet,
          ),
          SizedBox(
            height: 20,
          ),
          ButtonCustom(
            txt: "Save Address",
            ontap: () {
              Navigator.of(context).pop();
            },
            bacgroudColor: kAppColor,
            textColor: kWhiteColor,
          )
        ],
      ),
    ));
  }
}
