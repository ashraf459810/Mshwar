// import 'package:dellyshop/models/brand_model.dart';
// import 'package:flutter/material.dart';

// class CategoryDetailBody extends StatefulWidget {
//   @override
//   _CategoryDetailBodyState createState() => _CategoryDetailBodyState();
// }

// class _CategoryDetailBodyState extends State<CategoryDetailBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CustomScrollView(
//         /// Create List Menu
//         slivers: <Widget>[
//           SliverPadding(
//             padding: EdgeInsets.only(top: 0.0),
//             sliver: SliverFixedExtentList(
//                 itemExtent: 175.0,
//                 delegate: SliverChildBuilderDelegate(

//                     /// Calling itemCard Class for constructor card
//                     (context, index) => ItemCard(brandData[index]),
//                     childCount: brandData.length)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ItemCard extends StatelessWidget {
//   /// Declaration and Get data from BrandDataList.dart
//   final Brand brand;
//   ItemCard(this.brand);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
//       child: InkWell(
//         onTap: () {
//           // Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //         builder: (context) => BrandDetailScreen()));
//         },
//         child: Container(
//           height: 130.0,
//           width: 400.0,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(0.0))),
//           child: Hero(
//             tag: 'hero-tag-${brand.id}',
//             child: Material(
//               color: Colors.transparent,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                   image: DecorationImage(
//                       image: AssetImage(brand.img), fit: BoxFit.cover),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(0.0)),
//                     color: Colors.black12.withOpacity(0.1),
//                   ),
//                   child: Center(
//                     child: Text(
//                       brand.name,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 35.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
