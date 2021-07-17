
import 'package:uuid/uuid.dart';

class ProductItemModel {
  String id;
  int ratingStart;
  String image;
  String title;
  String normalPrice;
  String discountPrice;
  String ratingValue;
  String stock;
  String sale;
  String company;
  bool sizable;
  bool colorable;
  String detailProduct;
  String description;
  List<String> images;

  ProductItemModel(
      {this.id,
      this.image,
      this.title,
      this.sale,
      this.ratingStart,
      this.normalPrice,
      this.discountPrice,
      this.ratingValue,
      this.stock,
      this.images,
      this.company,
      this.detailProduct,
      this.description,
      this.colorable = true,
      this.sizable = false});
}

List<ProductItemModel> productList = [
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/iphone11.jpeg",
      images: ["assets/images/iphone11.jpeg", "assets/images/iphone11.jpeg"],
      title: "İphone 11 Pro Max 64 GB",
      normalPrice: "949.99\$",
      discountPrice: "849.99\$",
      ratingStart: 4,
      company: "Apple",
      sale: "210",
      ratingValue: "(10)",
      stock: "30 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/mackbook.jpg",
      title: "Apple Macbook Pro 13 with Touch Bar",
      images: ["assets/images/mackbook.jpg", "assets/images/mackbook.jpg"],
      normalPrice: "2,020\$",
      sale: "10",
      company: "Apple",
      discountPrice: "1,300\$",
      ratingStart: 4,
      ratingValue: "(56)",
      stock: "9 Available",
      detailProduct:
          "1) MackBook Pro \n\n2) SSD 512 GB \n\n3) Ram 8 GB DDR4\n\n4) Touch Bar ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale2.jpg",
      images: ["assets/images/flashsale2.jpg", "assets/images/flashsale2.jpg"],
      title: "7 Level Karina Dress Sweet Pesta",
      normalPrice: "14\$",
      sale: "23",
      company: "Clothes",
      discountPrice: "10\$",
      ratingStart: 3,
      sizable: true,
      ratingValue: "(16)",
      stock: "24 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale3.JPG",
      images: ["assets/images/flashsale3.JPG", "assets/images/flashsale3.JPG"],
      title: "Samsung Galaxy Note 9 8GB - 512GB",
      normalPrice: "1,132\$",
      sale: "63",
      company: "Samsung",
      discountPrice: "950\$",
      ratingStart: 4,
      ratingValue: "(20)",
      stock: "14 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale4.jpg",
      images: ["assets/images/flashsale4.jpg", "assets/images/flashsale4.jpg"],
      title: "Harry Potter Spesial Edition ",
      normalPrice: "25\$",
      company: "Book",
      colorable: false,
      discountPrice: "20\$",
      ratingStart: 4,
      sale: "93",
      ratingValue: "(22)",
      stock: "5 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale5.jpg",
      images: ["assets/images/flashsale5.jpg", "assets/images/flashsale5.jpg"],
      title: "Pro Evolution Soccer 2019 Steam Original PC Games",
      normalPrice: "50\$",
      colorable: false,
      discountPrice: "30\$",
      company: "PC Games",
      ratingStart: 4,
      sale: "93",
      ratingValue: "(10)",
      stock: "30 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/cameraItem1.png",
      images: [
        "assets/images/cameraItem1.png",
        "assets/images/cameraItem1.png"
      ],
      sale: "73",
      title: "Camera DSLR C"
          "1000",
      company: "Canon",
      colorable: false,
      normalPrice: "400\$",
      discountPrice: "200\$",
      ratingStart: 4,
      ratingValue: "(10)",
      stock: "10 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
    id: Uuid().v4(),
    image: "assets/images/shoes2.jpg",
    images: ["assets/images/shoes2.jpg", "assets/images/shoes2.jpg"],
    title: "Nike Sport Shoes Running Man White",
    normalPrice: "199.9\$",
    discountPrice: "99.9\$",
    detailProduct:
        "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
    ratingStart: 2,
    company: "Apple",
    sale: "13",
    ratingValue: "(6)",
    stock: "13 Available",
  ),
];
List<ProductItemModel> newestLit = [
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/iphone11.jpeg",
      images: ["assets/images/iphone11.jpeg", "assets/images/iphone11.jpeg"],
      title: "İphone 11 Pro Max 64 GB",
      normalPrice: "949.99\$",
      discountPrice: "849.99\$",
      ratingStart: 4,
      company: "Apple",
      sale: "210",
      ratingValue: "(10)",
      stock: "30 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/mackbook.jpg",
      title: "Apple Macbook Pro 13 with Touch Bar",
      images: ["assets/images/mackbook.jpg", "assets/images/mackbook.jpg"],
      normalPrice: "2,020\$",
      sale: "10",
      company: "Apple",
      discountPrice: "1,300\$",
      ratingStart: 4,
      ratingValue: "(56)",
      stock: "9 Available",
      detailProduct:
          "1) MackBook Pro \n\n2) SSD 512 GB \n\n3) Ram 8 GB DDR4\n\n4) Touch Bar ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale2.jpg",
      images: ["assets/images/flashsale2.jpg", "assets/images/flashsale2.jpg"],
      title: "7 Level Karina Dress Sweet Pesta",
      normalPrice: "14\$",
      sizable: true,
      sale: "23",
      company: "Clothes",
      discountPrice: "10\$",
      ratingStart: 3,
      ratingValue: "(16)",
      stock: "24 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale3.JPG",
      images: ["assets/images/flashsale3.JPG", "assets/images/flashsale3.JPG"],
      title: "Samsung Galaxy Note 9 8GB - 512GB",
      normalPrice: "1,132\$",
      sale: "63",
      company: "Samsung",
      discountPrice: "950\$",
      ratingStart: 4,
      ratingValue: "(20)",
      stock: "14 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale4.jpg",
      images: ["assets/images/flashsale4.jpg", "assets/images/flashsale4.jpg"],
      title: "Harry Potter Spesial Edition ",
      normalPrice: "25\$",
      colorable: false,
      company: "Book",
      discountPrice: "20\$",
      ratingStart: 4,
      sale: "93",
      ratingValue: "(22)",
      stock: "5 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/flashsale5.jpg",
      images: ["assets/images/flashsale5.jpg", "assets/images/flashsale5.jpg"],
      title: "Pro Evolution Soccer 2019 Steam Original PC Games",
      normalPrice: "50\$",
      discountPrice: "30\$",
      colorable: false,
      company: "PC Games",
      ratingStart: 4,
      sale: "93",
      ratingValue: "(10)",
      stock: "30 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
  ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/cameraItem1.png",
      images: [
        "assets/images/cameraItem1.png",
        "assets/images/cameraItem1.png"
      ],
      sale: "73",
      title: "Camera DSLR C1000",
      company: "Canon",
      colorable: false,
      normalPrice: "400\$",
      discountPrice: "200\$",
      ratingStart: 4,
      ratingValue: "(10)",
      stock: "10 Available",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen....."),
];
