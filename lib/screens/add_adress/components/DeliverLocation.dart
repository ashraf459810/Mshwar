import 'package:dellyshop/Widgets%20copy/Container.dart';
import 'package:dellyshop/Widgets%20copy/TextForm.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/CitiesModel/cities.dart';
import 'package:dellyshop/screens/add_adress/components/GetLocationBloc/getlocation_bloc.dart';

import 'package:dellyshop/screens/register/components/bloc/register_bloc.dart'
    as c;
import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toast/toast.dart';

class DelieverLocation extends StatefulWidget {
  final Function f;
  DelieverLocation({Key key, this.f}) : super(key: key);

  @override
  _DelieverLocationState createState() => _DelieverLocationState();
}

class _DelieverLocationState extends State<DelieverLocation> {
  TextEditingController controller = TextEditingController();
  String street;
  String country;
  String city;
  String street2;
  String country2;
  String city2;
  String dropdownvalue;
  List<City> cities = [];
  City chosencity;
  int chosencityid;
  TextEditingController buildingc = TextEditingController();
  TextEditingController apartmentc = TextEditingController();
  String building;
  String apartment;

  c.RegisterBloc registerBloc = c.RegisterBloc();
  Set<Marker> markers = {};
  String selectcity = "select city";
  LatLng currentPostion;
  LatLng markerlocation;
  String addressname;
  @override
  void initState() {
    registerBloc.add(c.CitiesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetlocationBloc()..add(LocationEvent()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    color: Colors.black,
                    height: size.height * 0.06,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.info_sharp,
                            color: Colors.white,
                          ),
                          Text(
                            "make a long press to mark your delivery location",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: BlocConsumer<GetlocationBloc, GetlocationState>(
                    listener: (context, state) {
                      if (state is AddAddressState) {
                        Toast.show(
                            "Added Successfiully to your Addresses", context,
                            duration: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.orange[900],
                            gravity: Toast.TOP);
                      }
                      if (state is Error) {
                        Toast.show(state.error, context,
                            duration: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.orange,
                            gravity: Toast.TOP);
                      }
                    },
                    builder: (context, state) {
                      // if (state is Loading) {
                      //   return Container(
                      //       child: Center(child: CircularProgressIndicator()));
                      // }
                      if (state is LocationState) {
                        currentPostion = LatLng(
                            state.position.latitude, state.position.longitude);

                        city = state.city;
                        country = state.country;
                        street = state.street;
                      }

                      return currentPostion != null
                          ? Stack(
                              children: [
                                Center(
                                  child: Container(
                                      height: size.height * 0.4,
                                      width: size.width,
                                      child: GoogleMap(
                                        myLocationButtonEnabled: false,

                                        myLocationEnabled: true,
                                        zoomControlsEnabled: false,
                                        //there is a lot more options you can add here

                                        onMapCreated: (controller) {
                                          Marker marker = Marker(
                                              position: currentPostion,
                                              markerId: MarkerId("IDs"));
                                          markers.add(marker);
                                          street2 = street;
                                          city2 = city;
                                          country2 = country;
                                          setState(() {});
                                        },
                                        gestureRecognizers: <
                                            Factory<
                                                OneSequenceGestureRecognizer>>[
                                          new Factory<
                                              OneSequenceGestureRecognizer>(
                                            () => new EagerGestureRecognizer(),
                                          ),
                                        ].toSet(),
                                        onLongPress: (argument) async {
                                          markers = {};
                                          markers.add(Marker(
                                              markerId: (MarkerId(
                                                "IDs",
                                              )),
                                              position: argument));
                                          print(markers.length);

                                          var info = await getLocationAddress(
                                              argument.latitude,
                                              argument.longitude);

                                          country2 = info[0].country;

                                          city2 = info[0].administrativeArea;

                                          street2 = info[0].street;
                                          print(street);
                                          setState(() {});
                                        },

                                        markers: markers,

                                        // onMapCreated: _onMapCreated,
                                        initialCameraPosition: CameraPosition(
                                          target: currentPostion,
                                          zoom: 17,
                                        ),
                                      )),
                                ),
                                markers.isNotEmpty
                                    ? Positioned(
                                        bottom: 1,
                                        // left: size.width * 0.15,
                                        child: Container(
                                            height: size.height * 0.08,
                                            width: size.width,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Country : $country2",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    " city:         $city2",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    " street :    $street2",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: kAppColor,
                                              // borderRadius: BorderRadius.all(
                                              //   Radius.circular(30),
                                              // ),
                                            )))
                                    : Container(),
                              ],
                            )
                          : ShimmerWidget(
                              child: Container(
                                height: size.height * 0.4,
                                color: Colors.grey[300],
                              ),
                            );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                BlocBuilder(
                  bloc: registerBloc,
                  builder: (context, state) {
                    if (state is c.CitiesState) {
                      cities = state.cities;
                    }

                    return Container(
                      color: Colors.white,
                      child: Builder(
                        builder: (context) => DropdownButton<City>(
                          hint: Center(child: Text(selectcity)),

                          value: chosencity,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,

                          // style: const TextStyle(color: Colors.deepPurple),

                          underline: SizedBox(),
                          onChanged: (City newValue) {
                            selectcity = newValue.title;
                            chosencityid = newValue.id;

                            setState(() {});
                          },

                          items:
                              cities.map<DropdownMenuItem<City>>((City value) {
                            return DropdownMenuItem<City>(
                              value: value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(value.title),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: size.height * 0.07,
                  width: size.width * 0.7,
                  child: TextFormField(
                    controller: controller,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintStyle: TextStyle(color: Colors.black),
                        // contentPadding:
                        //     EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                        // contentPadding: EdgeInsets.only(left: size.width *0.33),
                        hintText: "Type your Address info"),
                    onChanged: (value) {
                      addressname = value;
                    },
                    onSaved: (newValue) {
                      addressname = newValue;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                container(
                  hight: size.height * 0.07,
                  width: size.width * 0.7,
                  borderRadius: 10,
                  bordercolor: Colors.orange,
                  color: Colors.white,
                  child: textform(
                      // horizontalpadding: 100,
                      controller: buildingc,
                      hint: "building num",
                      validation: "name",
                      hintsize: 15,
                      function: (value) {
                        building = value;
                      }),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                container(
                  hight: size.height * 0.07,
                  width: size.width * 0.7,
                  borderRadius: 10,
                  color: Colors.white,
                  bordercolor: Colors.orange,
                  child: textform(
                      // horizontalpadding: 90,
                      controller: apartmentc,
                      hint: "apartment num",
                      hintsize: 15,
                      validation: "name",
                      function: (value) {
                        apartment = value;
                      }),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      print(chosencity);
                      print(currentPostion.latitude);
                      print(addressname);
                      if (selectcity != "select city" &&
                          currentPostion != null &&
                          addressname != null) {
                        context.read<GetlocationBloc>().add(AddAddressEvent(
                            building + apartment,
                            addressname,
                            chosencityid,
                            currentPostion.latitude,
                            currentPostion.longitude));

                        Navigator.of(context).pop(widget.f());
                      } else {
                        Toast.show("please fill all the fields", context,
                            duration: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.orange[900],
                            gravity: Toast.TOP);
                      }
                    },
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kAppColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Address",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Placemark>> getLocationAddress(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }
}
