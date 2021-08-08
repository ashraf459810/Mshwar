// class CategoryShops extends StatefulWidget {

import 'package:dellyshop/models/CategoyShopsModel/CategoryShopsModel.dart';

import 'package:dellyshop/models/category_models.dart';
import 'package:dellyshop/screens/CategoryShops/CategoryShopsBuilder.dart';
import 'package:dellyshop/screens/home/components/bloc/home_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../util.dart';

class CategoryShops extends StatefulWidget {
  final Category category;
  CategoryShops(this.category);
  @override
  _CategoryShopsState createState() => _CategoryShopsState();
}

class _CategoryShopsState extends State<CategoryShops> {
  List<Shop> shops = [];

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    /// Hero animation for image
    final hero = Hero(
        tag: 'hero-tag-${widget.category.id}',
        child: Container(
            child: Image.network(
          "${widget.category.image}",
          fit: BoxFit.cover,
        )));

    return BlocProvider(
        create: (context) => HomeBloc()
          ..add(GetCategoryShopsEvent(widget.category.id.toString())),
        child: Scaffold(
            backgroundColor:
                Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
            key: _key,
            body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
              if (state is Error) {
                return Container(
                  color: Colors.orange[900],
                  child: Center(
                    child: Text(state.error),
                  ),
                );
              }
              if (state is GetCategoryShopsState) {
                shops = state.categoryShopsModel.shops;
              }
              return CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  /// Appbar Custom using a SliverAppBar
                  SliverAppBar(
                    centerTitle: true,
                    backgroundColor: Utils.isDarkMode
                        ? kDarkDefaultBgColor
                        : kDefaultBgColor,
                    iconTheme: IconThemeData(color: kAppColor),
                    expandedHeight: 380.0,
                    elevation: 0.1,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          widget.category.titleEn,
                          style: TextStyle(
                              color: kAppColor,
                              fontSize: 17.0,
                              fontFamily: "Popins",
                              fontWeight: FontWeight.w700),
                        ),
                        background: Material(
                          child: hero,
                        )),
                  ),

                  /// Container for description to Sort and Refine
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Create Grid Item
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                height: h(300),
                                width: w(200),
                                child: shops.isNotEmpty
                                    ? Center(
                                        child: CategoryShopsBuilder(
                                          shop: shops[index],
                                        ),
                                      )
                                    : Container(),
                              ),
                            ));
                      },
                      childCount: shops.length,
                    ),

                    /// Setting Size for Grid Item
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250.0,
                      mainAxisSpacing: 7.0,
                      crossAxisSpacing: 7.0,
                      childAspectRatio: 5 / 3,
                    ),
                  ),
                ],
              );
            })));
  }
}
