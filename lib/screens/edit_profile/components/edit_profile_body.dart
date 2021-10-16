import 'dart:io';

import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/ProfileModel/ProfileModel.dart';

import 'package:dellyshop/screens/progfile/components/bloc/profile_bloc.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

import '../../../app_localizations.dart';

class EditProfileBody extends StatefulWidget {
  final ProfileModel profileModel;
  EditProfileBody([this.profileModel]);
  @override
  _EditProfileBodyState createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  ProfileBloc profileBloc = ProfileBloc();
  String email;
  String mobile;
  String name;
  // ignore: unused_field
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Hero(
                    tag: "profile",
                    child: Material(
                      child: GestureDetector(
                        onTap: () {
                          // _showPicker(context);
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: h(150),
                              width: w(150),
                              child: Icon(
                                Icons.account_circle_sharp,
                                size: 100,
                                color: kAppColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      height: 60.0,
                      icon: Icons.person,
                      ispassword: false,
                      placeHolder: "${widget.profileModel.name}",
                      inputType: TextInputType.text,
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextFromField(
                height: 60.0,
                icon: Icons.mail,
                ispassword: false,
                placeHolder: "${widget.profileModel.email}",
                inputType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextFromField(
                height: 60.0,
                icon: Icons.mobile_friendly,
                ispassword: false,
                placeHolder: "${widget.profileModel.phone}",
                inputType: TextInputType.phone,
                onChanged: (value) {
                  mobile = value;
                },
              ),
              SizedBox(height: h(80)),
              GestureDetector(
                onTap: () {},
                child: BlocConsumer(
                  bloc: profileBloc,
                  listener: (context, state) {
                    if (state is EditProfileState) {
                      Toast.show(
                          ApplicationLocalizations.of(context)
                              .translate("Updated Successfully"),
                          context,
                          duration: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.orange,
                          gravity: Toast.TOP);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationBar(),
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is Loading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is Error) {
                      return Center(
                        child: Text(
                          state.error,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }

                    return ButtonCustom(
                      txt: ApplicationLocalizations.of(context)
                          .translate("save"),
                      ontap: () {
                        if (mobile != null && email != null && name != null)
                          profileBloc
                              .add(EditProfileEvent((mobile), email, name));
                        else
                          Toast.show(
                              ApplicationLocalizations.of(context)
                                  .translate("Please update your info first"),
                              context);
                      },
                      bacgroudColor: kAppColor,
                      textColor: kWhiteColor,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // _imgFromGallery() async {
  //   var image = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (image != null) {
  //       _image = File(image.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  // _imgFromCamera() async {
  //   var image = await picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     if (image != null) {
  //       _image = File(image.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

//   void showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_library),
//                       title: new Text('Photo Library'),
//                       onTap: () {
//                         _imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_camera),
//                     title: new Text('Camera'),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

  double h(double h) {
    return ScreenUtil().setHeight(h);
  }

  double w(double w) {
    return ScreenUtil().setWidth(w);
  }
}
