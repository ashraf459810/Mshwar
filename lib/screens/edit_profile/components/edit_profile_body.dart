import 'dart:io';

import 'package:dellyshop/constant.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app_localizations.dart';

class EditProfileBody extends StatefulWidget {
  @override
  _EditProfileBodyState createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        _showPicker(context);
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: _image == null
                                      ? AssetImage(
                                          "assets/images/profilepic.jpg")
                                      : FileImage(_image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 20,
                            color: Colors.black.withOpacity(0.5),
                            child: NormalTextWidget(
                                ApplicationLocalizations.of(context)
                                    .translate("edit"),
                                kWhiteColor,
                                kMicroFontSize),
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
                    placeHolder: "Briana",
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: CustomTextFromField(
                    height: 60.0,
                    icon: Icons.person,
                    ispassword: false,
                    placeHolder: "Lane",
                    inputType: TextInputType.text,
                  ),
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
              placeHolder: "XamAppDesign@gmail.com",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonCustom(
              txt: ApplicationLocalizations.of(context).translate("save"),
              ontap: () {
                Navigator.of(context).pop();
              },
              bacgroudColor: kAppColor,
              textColor: kWhiteColor,
            )
          ],
        ),
      ),
    );
  }

  _imgFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgFromCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
