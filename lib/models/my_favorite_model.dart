

import 'package:dellyshop/constant.dart';


class MyFavoriteModel {
  int id;
  String productName;
  String companyName;
  String productImage;
  int orderNo;
  DateTime orderDate;
  String orderStatus;
  bool isSelect;
  double price;
  double itemHeight;
  int arrowRotate;

  MyFavoriteModel(
      {this.id,
      this.price,
      this.productName,
      this.companyName,
      this.productImage,
      this.orderNo,
      this.orderDate,
      this.orderStatus,
      this.isSelect,
      this.arrowRotate = 0,
      this.itemHeight = 150});
}

List<MyFavoriteModel> myFavList = [
  MyFavoriteModel(
    id: 1,
    productName: "iPHone 11 Pro 64 GB",
    companyName: "Apple",
    productImage: kiPhoneImg,
    orderNo: 456876546,
    orderDate: DateTime.now(),
    orderStatus: "Packing Stage",
    isSelect: false,
    price: 949.99,
  ),
  MyFavoriteModel(
    id: 2,
    productName: "Macbook Pro 13\" 256 GB",
    companyName: "Apple",
    productImage: "assets/images/mackbook.jpg",
    orderNo: 8657464367,
    orderDate: DateTime.now(),
    orderStatus: "Shipped",
    isSelect: false,
    price: 449.99,
  ),
  MyFavoriteModel(
    id: 3,
    productName: "Nike Air Max 270",
    companyName: "Nike",
    productImage: "assets/images/shoes2.jpg",
    orderNo: 9574869048,
    orderDate: DateTime.now(),
    orderStatus: "Completed",
    isSelect: false,
    price: 130.99,
  ),
];
