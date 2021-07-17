import '../constant.dart';

class MyCommentModel {
  int id;
  String productName;
  String companyName;
  String productImage;
  int range;
  DateTime commentDate;
  String userName;
  String userComment;
  bool isSelect;
  double price;
  double itemHeight;
  int arrowRotate;

  MyCommentModel(
      {this.id,
      this.price,
      this.productName,
      this.companyName,
      this.productImage,
      this.range,
      this.userName,
      this.commentDate,
      this.userComment,
      this.isSelect,
      this.arrowRotate = 0,
      this.itemHeight = 150});
}

List<MyCommentModel> myCommentList = [
  MyCommentModel(
    id: 1,
    productName: "iPhone 11 Pro 64 GB",
    companyName: "Apple",
    productImage: kiPhoneImg,
    range: 3,
    commentDate: DateTime.now(),
    userName: "Ufuk Zimmerman",
    userComment:
        "Good quality and beautiful product. The cargo arrived later than expected.",
    isSelect: false,
    price: 949.99,
  ),
  MyCommentModel(
    id: 2,
    productName: "Macbook Pro 13\" 256 GB",
    companyName: "Apple",
    productImage: "assets/images/mackbook.jpg",
    userName: "Ufuk Zimmerman",
    userComment: "Nice machine, I love Apple products!",
    range: 5,
    commentDate: DateTime.now(),
    isSelect: false,
    price: 449.99,
  ),
  MyCommentModel(
    id: 3,
    productName: "Nike Air Max 270",
    companyName: "Nike",
    productImage: "assets/images/shoes2.jpg",
    range: 4,
    commentDate: DateTime.now(),
    userName: "Ufuk Zimmerman",
    userComment:
        "It is a very fast and stable product. I really like! The cargo arrived very quickly. I am very pleased with this situation. I will now make my other orders with you.",
    isSelect: false,
    price: 130.99,
  )
];
