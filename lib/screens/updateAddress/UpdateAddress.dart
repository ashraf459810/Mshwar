import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart' as a;
import 'package:dellyshop/models/CitiesModel/cities.dart';
import 'package:dellyshop/screens/ItemDetails/bloc/cart_bloc.dart' as cart;

import 'package:dellyshop/screens/add_adress/components/GetLocationBloc/getlocation_bloc.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';

import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dellyshop/screens/register/components/bloc/register_bloc.dart'
    as c;
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toast/toast.dart';

class UpdateAddress extends StatefulWidget {
  UpdateAddress({Key key}) : super(key: key);

  @override
  _UpdateAddressState createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
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
  List<a.Address> address = [];
  String selectaddress = "select address";
  c.RegisterBloc registerBloc = c.RegisterBloc();
  Set<Marker> markers = {};
  String selectcity = "select city";
  LatLng currentPostion;
  LatLng markerlocation;
  String addressname;
  cart.CartBloc cartBloc = cart.CartBloc();
  String selectedaddress;
  int chosenaddressid;
  var chosenaddress;
  @override
  void initState() {
    registerBloc.add(c.CitiesEvent());
    cartBloc.add(cart.GetAddressEvent());
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
                      if (state is Error) {
                        Toast.show(state.error, context,
                            duration: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.orange,
                            gravity: Toast.TOP);
                      }
                      if (state is UpdateAddressState) {
                        Toast.show("Address Updated Successfully", context,
                            duration: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.orange,
                            gravity: Toast.TOP);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomBottomNavigationBar(),
                        ));
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
                SizedBox(
                  height: size.height * 0.03,
                ),
                BlocBuilder(
                  bloc: cartBloc,
                  builder: (context, state) {
                    if (state is cart.Loading) {
                      return CircularProgressIndicator();
                    }
                    if (state is cart.GetAddressState) {
                      address = state.addressModel.addresses;
                    }
                    if (state is cart.Error) {
                      return Center(
                        child: Text(
                          state.error,
                          style: TextStyle(color: kAppColor),
                        ),
                      );
                    }
                    return Container(
                      color: Colors.white,
                      child: DropdownButton<a.Address>(
                        hint: Center(child: Text(selectaddress)),

                        value: chosenaddress,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,

                        // style: const TextStyle(color: Colors.deepPurple),

                        underline: SizedBox(),
                        onChanged: (a.Address newValue) {
                          selectaddress = newValue.name;
                          chosenaddressid = newValue.id;

                          setState(() {});
                        },

                        items: address.map<DropdownMenuItem<a.Address>>(
                            (a.Address value) {
                          return DropdownMenuItem<a.Address>(
                            value: value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(value.name),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: size.height * 0.04,
                  width: size.width,
                  child: Center(
                    child: TextFormField(
                      controller: controller,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(right: 20),
                          hintText: "Type new Address name"),
                      onChanged: (value) {
                        addressname = value;
                      },
                      onSaved: (newValue) {
                        addressname = newValue;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Builder(
                  builder: (context) => GestureDetector(
                      onTap: () {
                        if (selectcity != "select city" &&
                            currentPostion != null &&
                            addressname != null &&
                            selectaddress != null &&
                            chosenaddressid != null) {
                          context.read<GetlocationBloc>().add(
                              UpdateAddressEvent(
                                  address1: addressname,
                                  addressid: chosenaddressid,
                                  cityid: chosencityid,
                                  lat: currentPostion.latitude,
                                  name: addressname,
                                  long: currentPostion.longitude));
                        } else {
                          Toast.show("please fill all the fields", context,
                              duration: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.orange,
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
                                "Update Address",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )),
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
