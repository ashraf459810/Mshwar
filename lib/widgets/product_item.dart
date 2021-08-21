// import 'package:dellyshop/models/product_item_model.dart';
// import 'package:flutter/material.dart';

// import '../constant.dart';
// import '../util.dart';
// import 'card_widget.dart';

// class ProductItem extends StatefulWidget {

//   @override
//   _ProductItemState createState() => _ProductItemState();
// }

// class _ProductItemState extends State<ProductItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Hero(
//         tag: "hero-Item-${widget.productItem.id}",
//         child: Material(
//           child: CardWidget(
//             height: 100,
//             childWidget: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(right: 10.0, top: 5.0),
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       image: DecorationImage(
//                         fit: BoxFit.fitHeight,
//                         image: AssetImage(widget.productItem.image),
//                       )),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(widget.productItem.title,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               color: Utils.isDarkMode
//                                   ? kDarkTextColorColor
//                                   : kLightBlackTextColor,
//                               fontSize: kTitleFontSize)),
//                       Text(widget.productItem.company,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               color: kGrayColor, fontSize: kSmallFontSize)),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         widget.productItem.normalPrice,
//                         style: TextStyle(
//                             color: kAppColor, fontSize: kPriceFontSize),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
