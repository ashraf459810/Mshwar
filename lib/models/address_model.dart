import 'package:uuid/uuid.dart';

class Address {
  String id;
  String addressName;
  String addressPinCode;
  String selectCountry;
  String selectCity;
  String selectStreet;

  Address(
      {this.id,
      this.addressName,
      this.addressPinCode,
      this.selectCountry,
      this.selectCity,
      this.selectStreet});
}

List<Address> addressList = [
  Address(
      id: Uuid().v4(),
      addressName: "Home Address",
      addressPinCode: "944523",
      selectCountry: "USA",
      selectCity: "NewYork",
      selectStreet: "Park Ave"),
  Address(
      id: Uuid().v4(),
      addressName: "Work Address",
      addressPinCode: "434523",
      selectCountry: "Germany",
      selectCity: "Berlin",
      selectStreet: "Lichtenberger"),
  Address(
      id: Uuid().v4(),
      addressName: "School Address",
      addressPinCode: "689694",
      selectCountry: "Denmark",
      selectCity: "Kopenhag",
      selectStreet: "Gammel Mønt")
];
