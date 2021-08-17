// import 'package:dellyshop/app_localizations.dart';
// import 'package:dellyshop/models/CategoyShopsModel/CategoryShopsModel.dart';

// import 'package:dellyshop/models/category_models.dart';
// import 'package:dellyshop/screens/CategoryShops/CategoryShops.dart';
// import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../constant.dart';
// import '../../util.dart';

// class BrandDetailScreen extends StatefulWidget {
//   final Category category;
//   BrandDetailScreen(this.category);

//   final List<int> list = [1, 2, 3, 4, 5];

//   @override
//   _BrandDetailScreenState createState() => _BrandDetailScreenState();
// }

// class _BrandDetailScreenState extends State<BrandDetailScreen> {
//   CategoryShopsModel categoryShopsModel = CategoryShopsModel();
//   final _fontCostumSheetBotomHeader = TextStyle(
//       color: Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
//       fontWeight: FontWeight.w600,
//       fontSize: kSubTitleFontSize);
//   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

//   /// Custom text for bottomSheet
//   final _fontCostumSheetBotom = TextStyle(
//       color: Utils.isDarkMode ? kDarkBlackTextColor : Colors.black45,
//       fontWeight: FontWeight.w400,
//       fontSize: kSubTitleFontSize);

//   /// Create Modal BottomSheet (SortBy)
//   void modalBottomSheetSort() {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return BlocProvider(
//             create: (context) => HomeBloc()
//               ..add(GetCategoryShopsEvent(widget.category.id.toString())),
//             child: SingleChildScrollView(
//               child: new Container(
//                 height: 340.0,
//                 color: Utils.isDarkMode ? kDarkDefaultBgColor : Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(padding: EdgeInsets.only(top: 20.0)),
//                     Text(
//                         ApplicationLocalizations.of(context)
//                             .translate("sort_by"),
//                         style: _fontCostumSheetBotomHeader),
//                     Padding(padding: EdgeInsets.only(top: 20.0)),
//                     Container(
//                       width: 500.0,
//                       color: Colors.black26,
//                       height: 0.5,
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 25.0)),
//                     InkWell(
//                         onTap: () {},
//                         child: Text(
//                           ApplicationLocalizations.of(context)
//                               .translate("popularity"),
//                           style: _fontCostumSheetBotom,
//                         )),
//                     Padding(padding: EdgeInsets.only(top: 25.0)),
//                     Text(
//                       ApplicationLocalizations.of(context).translate("new"),
//                       style: _fontCostumSheetBotom,
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 25.0)),
//                     Text(
//                       ApplicationLocalizations.of(context)
//                           .translate("discount"),
//                       style: _fontCostumSheetBotom,
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 25.0)),
//                     Text(
//                       ApplicationLocalizations.of(context)
//                           .translate("high_low"),
//                       style: _fontCostumSheetBotom,
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 25.0)),
//                     Text(
//                       ApplicationLocalizations.of(context)
//                           .translate("low_high"),
//                       style: _fontCostumSheetBotom,
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 25.0)),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   /// Create Modal BottomSheet (RefineBy)
//   void modalBottomSheetRefine() {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return SingleChildScrollView(
//             child: new Container(
//               height: 340.0,
//               color: Utils.isDarkMode ? kDarkDefaultBgColor : Colors.white,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only(top: 20.0)),
//                   Text(
//                       ApplicationLocalizations.of(context)
//                           .translate("refine_by"),
//                       style: _fontCostumSheetBotomHeader),
//                   Padding(padding: EdgeInsets.only(top: 20.0)),
//                   Container(
//                     width: 500.0,
//                     color: Colors.black26,
//                     height: 0.5,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 25.0)),
//                   InkWell(
//                       onTap: () {},
//                       child: Text(
//                         ApplicationLocalizations.of(context)
//                             .translate("popularity"),
//                         style: _fontCostumSheetBotom,
//                       )),
//                   Padding(padding: EdgeInsets.only(top: 25.0)),
//                   Text(
//                     ApplicationLocalizations.of(context).translate("new"),
//                     style: _fontCostumSheetBotom,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 25.0)),
//                   Text(
//                     ApplicationLocalizations.of(context).translate("discount"),
//                     style: _fontCostumSheetBotom,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 25.0)),
//                   Text(
//                     ApplicationLocalizations.of(context).translate("high_low"),
//                     style: _fontCostumSheetBotom,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 25.0)),
//                   Text(
//                     ApplicationLocalizations.of(context).translate("low_high"),
//                     style: _fontCostumSheetBotom,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 25.0)),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     /// Hero animation for image
//     final hero = BlocConsumer<HomeBloc, HomeState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         if (state is Loading) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Colors.orange,
//             ),
//           );
//         }
//         if (state is Error) {
//           return Center(
//               child: Text(state.error,
//                   style: TextStyle(
//                     color: Colors.black,
//                   )));
//         }
//         if (state is GetCategoryShopsState) {
//           categoryShopsModel = state.categoryShopsModel;
//         }
//         return categoryShopsModel != null
//             ? Hero(
//                 tag: 'hero-tag-${widget.category.id}',
//                 child: Material(
//                   child: new DecoratedBox(
//                     decoration: new BoxDecoration(
//                       image: new DecorationImage(
//                         fit: BoxFit.cover,
//                         image: new AssetImage(widget.category.image),
//                       ),
//                       shape: BoxShape.rectangle,
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.only(top: 130.0),
//                       decoration: BoxDecoration(),
//                     ),
//                   ),
//                 ),
//               )
//             : Container();
//       },
//     );
//     return Scaffold(
//       backgroundColor: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
//       key: _key,
//       body: CustomScrollView(
//         scrollDirection: Axis.vertical,
//         slivers: <Widget>[
//           /// Appbar Custom using a SliverAppBar
//           SliverAppBar(
//             centerTitle: true,
//             backgroundColor:
//                 Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
//             iconTheme: IconThemeData(color: kAppColor),
//             expandedHeight: 380.0,
//             elevation: 0.1,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 title: Text(
//                   widget.category.titleEn,
//                   style: TextStyle(
//                       color: kAppColor,
//                       fontSize: 17.0,
//                       fontFamily: "Popins",
//                       fontWeight: FontWeight.w700),
//                 ),
//                 background: Material(
//                   child: hero,
//                 )),
//           ),

//           /// Container for description to Sort and Refine
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(
//                           top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
//                       child: Container(
//                         height: 150.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 30.0, left: 20.0, right: 20.0),
//                               child: Text(
//                                 ApplicationLocalizations.of(context)
//                                     .translate("lorem"),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 15.0,
//                                     color: Utils.isDarkMode
//                                         ? kDarkTextColorColor
//                                         : Colors.black54),
//                               ),
//                             ),
//                             Padding(padding: EdgeInsets.only(top: 10.0)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           /// Create Grid Item
//           SliverGrid(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 CategoryShops(category: widget.category)));
//                   },
//                 );
//               },
//               childCount: 5,
//             ),

//             /// Setting Size for Grid Item
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 250.0,
//               mainAxisSpacing: 7.0,
//               crossAxisSpacing: 7.0,
//               childAspectRatio: 0.605,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
