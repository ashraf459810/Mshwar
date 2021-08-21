import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/Text.dart';
import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/SearchResponse/Search.dart';

import 'package:dellyshop/screens/App/components/Signup.dart';
import 'package:dellyshop/screens/ItemDetails/ItemDetails.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util.dart';
import 'bloc/search_bloc.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  String search;
  bool isenglish;
  List<Data> data = [];
  bool noresult = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, right: 10.0, left: 10.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Utils.isDarkMode
                          ? kDarkLightCardColorColor
                          : kCardColorColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15.0,
                            spreadRadius: 0.0)
                      ]),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Theme(
                        data: ThemeData(hintColor: Colors.transparent),
                        child: Builder(
                          builder: (context) => TextFormField(
                            style: TextStyle(
                                color: Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.search,
                                  color: kAppColor,
                                  size: 28.0,
                                ),
                                hintText: ApplicationLocalizations.of(context)
                                    .translate("search"),
                                hintStyle: TextStyle(
                                    color: Utils.isDarkMode
                                        ? kDarkTextColorColor
                                        : kTextColorColor,
                                    fontWeight: FontWeight.w400)),
                            onChanged: (value) {
                              search = value;
                            },
                            onFieldSubmitted: (value) {
                              print('here inside save func');
                              if (value.contains(RegExp(r'[A-Z]'))) {
                                print('here inside en search');
                                context
                                    .read<SearchBloc>()
                                    .add(GetSearchEvent(search, true));
                              } else {
                                context
                                    .read<SearchBloc>()
                                    .add(GetSearchEvent(search, false));
                              }
                            },
                            onSaved: (value) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h(30),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange[900],
                      ),
                    );
                  }
                  if (state is Error) {
                    return Center(child: Text(state.error));
                  }
                  if (state is GetSearchState) {
                    data = state.searchResponse.items.data;
                    if (state.searchResponse.items.data.isEmpty) {
                      print("true");
                      noresult = true;
                    } else {
                      noresult = false;
                    }
                    if (state.isenglish) {
                      isenglish = true;
                    } else {
                      isenglish = false;
                    }
                  }
                  return data.isNotEmpty
                      ? Container(
                          height: h(650),
                          width: w(350),
                          child: ListView.builder(
                              physics: ScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              // ignore: missing_return
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ItemDetails(
                                        data: data[index],
                                      ),
                                    ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: container(
                                      borderRadius: 16,
                                      hight: h(100),
                                      width: w(200),
                                      shadow: true,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            child: Container(
                                                color: Colors.red,
                                                child: Image.network(
                                                  "${data[index].images}",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: w(40),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              // SizedBox(
                                              //   height: h(10),
                                              // ),
                                              text(
                                                  text: isenglish
                                                      ? "${data[index].title}"
                                                      : "${data[index].title}",
                                                  color: Colors.grey[900]),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: w(150),
                                                    minHeight: h(10),
                                                    maxHeight: h(30)),
                                                child: text(
                                                    text: isenglish
                                                        ? "${data[index].descriptionEn}"
                                                        : "${data[index].description}",
                                                    fontsize: 11,
                                                    color: Colors.grey),
                                              ),
                                              text(
                                                  text:
                                                      "Price ${data[index].price}",
                                                  color: Colors.orange[900]),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : noresult
                          ? Container(
                              child: Center(
                                child: Text(
                                  "No results found",
                                  style: TextStyle(
                                      color: Colors.orange[900], fontSize: 20),
                                ),
                              ),
                            )
                          : Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
