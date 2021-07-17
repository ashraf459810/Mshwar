import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/address_model.dart';
import 'package:dellyshop/widgets/custom_drop_down_button.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class AddAddressBody extends StatefulWidget {
  @override
  _AddAddressBodyState createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
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
            placeHolder:
                ApplicationLocalizations.of(context).translate("address_title"),
            inputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          CustomTextFromField(
            height: 60.0,
            icon: Icons.pin_drop,
            ispassword: false,
            placeHolder:
                ApplicationLocalizations.of(context).translate("pin_code"),
            inputType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
          ),
          SizedBox(height: 20),
          CustomDropDownButton(
            dropDownButtonItems:
                addressList.map((e) => e.selectCountry).toList(),
            placeHolder: ApplicationLocalizations.of(context)
                .translate("select_country"),
          ),
          SizedBox(height: 20),
          CustomDropDownButton(
            dropDownButtonItems: addressList.map((e) => e.selectCity).toList(),
            placeHolder:
                ApplicationLocalizations.of(context).translate("select_city"),
          ),
          SizedBox(height: 20),
          CustomDropDownButton(
            dropDownButtonItems:
                addressList.map((e) => e.selectStreet).toList(),
            placeHolder:
                ApplicationLocalizations.of(context).translate("select_street"),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonCustom(
            txt: ApplicationLocalizations.of(context).translate("add_address"),
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
