import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/AddressModel/AddressModel.dart';
import 'package:dellyshop/screens/App/App.dart';
import 'package:dellyshop/screens/App/components/Signup.dart';

import 'package:dellyshop/screens/add_adress/components/GetLocationBloc/getlocation_bloc.dart';
import 'package:dellyshop/screens/home/home_screen.dart';
import 'package:dellyshop/screens/login/login_screen.dart';

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

class Taxi extends StatefulWidget {
  final bool islogin;
  Taxi({Key key, this.islogin}) : super(key: key);

  @override
  _TaxiState createState() => _TaxiState();
}

class _TaxiState extends State<Taxi> {
  String selectedaddreddname;
  TextEditingController controller = TextEditingController();
  String street;
  String country;
  String city;
  String street2;
  String country2;
  String city2;
  String dropdownvalue;

  c.RegisterBloc registerBloc = c.RegisterBloc();
  Set<Marker> markers = {};
  String selectcity = "select city";
  LatLng currentPostion;
  bool islogin = false;
  LatLng markerlocation;
  String addressname;
  int selectedAddress;
  List<Address> address = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetlocationBloc()..add(GetIfLoginEvent()),
      child: Scaffold(
        body: widget.islogin
            ? SafeArea(
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
                            if (state is TaxiOrderState) {
                              Toast.show("Order Placed Successfully", context,
                                  duration: 3,
                                  gravity: 0,
                                  backgroundColor: Colors.orange[900]);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                            }
                            if (state is Error) {
                              Toast.show(state.error, context,
                                  duration: Toast.LENGTH_SHORT,
                                  backgroundColor: Colors.orange,
                                  gravity: Toast.TOP);
                            }
                          },
                          builder: (context, state) {
                            if (state is GetIfLoginState) {
                              islogin = state.islogin;
                              print(islogin);
                              if (state.islogin == false)
                                return Container();
                              else
                                context
                                    .read<GetlocationBloc>()
                                    .add(LocationEvent());
                            }
                            if (state is LocationState) {
                              currentPostion = LatLng(state.position.latitude,
                                  state.position.longitude);

                              city = state.city;
                              country = state.country;
                              street = state.street;
                              context
                                  .read<GetlocationBloc>()
                                  .add(GetAddressEvent());
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

                                              onMapCreated: (controller) {},
                                              gestureRecognizers: <
                                                  Factory<
                                                      OneSequenceGestureRecognizer>>[
                                                new Factory<
                                                    OneSequenceGestureRecognizer>(
                                                  () =>
                                                      new EagerGestureRecognizer(),
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

                                                var info =
                                                    await getLocationAddress(
                                                        argument.latitude,
                                                        argument.longitude);

                                                country2 = info[0].country;

                                                city2 =
                                                    info[0].administrativeArea;

                                                street2 = info[0].street;
                                                print(street);
                                                setState(() {});
                                              },

                                              markers: markers,

                                              // onMapCreated: _onMapCreated,
                                              initialCameraPosition:
                                                  CameraPosition(
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          " Country : $country2",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          " city:         $city2",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          " street :    $street2",
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                      SizedBox(height: size.height * 0.03),
                      Text(
                        "Pick up Location",
                        style:
                            TextStyle(color: Colors.orange[900], fontSize: 18),
                      ),
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<GetlocationBloc, GetlocationState>(
                        builder: (context, state) {
                          if (state is GetAddressState) {
                            address = state.addressModel.addresses;
                          }
                          return address.isNotEmpty
                              ? Container(
                                  width: size.width,
                                  height: size.height * 0.1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: h(50),
                                        width: w(300),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orange),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: DropdownButton<Address>(
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          hint: selectedaddreddname == null
                                              ? Text("    select address")
                                              : Text(
                                                  "    $selectedaddreddname"),
                                          items: address.map((Address value) {
                                            return DropdownMenuItem<Address>(
                                              value: value,
                                              child: new Text(value.name),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            print(selectedAddress);
                                            selectedaddreddname = value.name;
                                            selectedAddress = value.id;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : address.isEmpty && state is GetAddressState
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: h(40),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                "No addresses added for you  ",
                                                style:
                                                    TextStyle(color: kAppColor),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                  builder: (context) => App(),
                                                ));
                                              },
                                              child: Container(
                                                child: Text(
                                                    "register or login first",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  : ShimmerWidget(
                                      child: Container(
                                        height: h(70),
                                        color: Colors.grey,
                                      ),
                                    );
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () {
                            selectedAddress != null
                                ? context.read<GetlocationBloc>().add(
                                    TaxiOrderEvent(
                                        selectedAddress,
                                        currentPostion.longitude,
                                        currentPostion.latitude))
                                : Toast.show("please select address", context,
                                    backgroundColor: Colors.orange[900]);
                          },
                          child: BlocBuilder<GetlocationBloc, GetlocationState>(
                            builder: (context, state) {
                              if (state is Loading) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Container(
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
                                        "Order Taxi",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: Container(
                    child: Center(
                        child: Text("Please Register or sign in first",
                            style: TextStyle(
                                color: Colors.orange[900], fontSize: 20)))),
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
