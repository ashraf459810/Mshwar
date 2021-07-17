import 'package:dellyshop/models/product_item_model.dart';
import 'package:uuid/uuid.dart';

class Brand {
  String id;
  String name;
  String img;
  String desc;
  ProductItemModel item;

  Brand({
    this.img,
    this.id,
    this.name,
    this.desc,
    this.item,
  });
}

List<Brand> brandData = [
  Brand(
    name: "Electronics",
    id: Uuid().v4(),
    img: "assets/images/apple.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: ProductItemModel(
      id: Uuid().v4(),
      image: "assets/images/iphone11.jpeg",
      images: ["assets/images/iphone11.jpeg", "assets/images/iphone11.jpeg"],
      title: "İphone 11 Pro 64 GB",
      normalPrice: "949.99\$",
      discountPrice: "849.99\$",
      detailProduct:
          "1)Lorem Ipsum is simply \n\n2)Lorem Ipsum is simply \n\n3)Lorem Ipsum is simply\n\n ",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
      ratingStart: 4,
      company: "Apple",
      sale: "210",
      ratingValue: "(10)",
      stock: "30 Available",
    ),
  ),
  Brand(
    name: "Shoes",
    id: Uuid().v4(),
    img: "assets/images/nike.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: ProductItemModel(
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
  ),
  Brand(
    name: "Gaming",
    id: Uuid().v4(),
    img: "assets/images/gaming.jpg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: ProductItemModel(
        id: Uuid().v4(),
        image: "assets/images/flashsale5.jpg",
        images: [
          "assets/images/flashsale5.jpg",
          "assets/images/flashsale5.jpg"
        ],
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
  ),
  Brand(
    name: "Clothes",
    id: Uuid().v4(),
    img: "assets/images/category_clothes.jpeg",
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    item: ProductItemModel(
        id: Uuid().v4(),
        image: "assets/images/flashsale2.jpg",
        images: [
          "assets/images/flashsale2.jpg",
          "assets/images/flashsale2.jpg"
        ],
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
  ),
];
