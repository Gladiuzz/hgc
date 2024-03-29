import 'dart:convert';
import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/service/imageAPI.dart';
import 'package:hgc/ui/pages/Home/Profile/Profile.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:hgc/ui/widgets/txtformfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int selectedRadio;
  var name, birth_date, phone_number, email, company_name, instagram;
  var image;
  File _image;

  // void baseImage() {
  //   String base64Image = base64Encode(_image.readAsBytesSync());
  // }

  TextEditingController _controllerFullName = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerCompanyName = TextEditingController();
  TextEditingController _controllerInstagram = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedRadio = context.bloc<UserCubit>().user.gender;
    name = context.bloc<UserCubit>().user.name;
    birth_date = context.bloc<UserCubit>().user.birthDate;
    phone_number = context.bloc<UserCubit>().user.phoneNumber;
    email = context.bloc<UserCubit>().user.email;
    company_name = context.bloc<UserCubit>().user.companyName;
    instagram = context.bloc<UserCubit>().user.socialInstagram;

    _controllerFullName = TextEditingController(text: name);
    _controllerPhoneNumber = TextEditingController(text: phone_number);
    _controllerEmail = TextEditingController(text: email);
    _controllerCompanyName = TextEditingController(text: company_name);
    _controllerInstagram = TextEditingController(text: instagram);
  }

  @override
  void dispose() {
    _controllerFullName.dispose();
    _controllerPhoneNumber.dispose();
    _controllerEmail.dispose();
    _controllerCompanyName.dispose();
    _controllerInstagram.dispose();
    super.dispose();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setDate(var dates) {
    setState(() {
      birth_date = dates;
    });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            titleSpacing: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: const Color(0xffb90b0c)),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                color: const Color(0xffb90b0c),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("get image");
                      _showPicker(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: Color(0xffFDCF09),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(55),
                                    child: Image.file(_image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover),
                                  )
                                : Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50),
                                      image: context
                                                  .bloc<UserCubit>()
                                                  .user
                                                  .image !=
                                              null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  '${(context.bloc<UserCubit>().state as UserLoaded).user.image}'),
                                              fit: BoxFit.cover,
                                            )
                                          : DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/default_avatar.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Upload Photo',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          txtFormField(
                            controller: _controllerFullName..text,
                            height: 45.0,
                            hint: "Full Name",
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 12,
                      ),
                      // Text(
                      //   'Gender',
                      //   style: TextStyle(
                      //     fontFamily: 'Lato',
                      //     fontSize: 15,
                      //     color: const Color(0xff858585),
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      //   textAlign: TextAlign.left,
                      // ),
                      // SizedBox(
                      //   height: 15.0,
                      // ),
                      // Container(
                      //   child: Row(
                      //     children: <Widget>[
                      //       Row(
                      //         children: [
                      //           Container(
                      //             width: 20.0,
                      //             height: 20.0,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.all(
                      //                   Radius.elliptical(9999.0, 9999.0)),
                      //               color: const Color(0xfff8f8f8),
                      //               border: Border.all(
                      //                   width: 2.0,
                      //                   color: const Color(0xffb90b0c)),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 5.0,
                      //           ),
                      //           Text(
                      //             'Male',
                      //             style: TextStyle(
                      //               fontFamily: 'Lato',
                      //               fontSize: 12,
                      //               color: const Color(0xff000000),
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //             textAlign: TextAlign.left,
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         width: 30,
                      //       ),
                      //       Row(
                      //         children: [
                      //           Container(
                      //             width: 20.0,
                      //             height: 20.0,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.all(
                      //                   Radius.elliptical(9999.0, 9999.0)),
                      //               color: const Color(0xfff8f8f8),
                      //               border: Border.all(
                      //                   width: 2.0,
                      //                   color: const Color(0xffb90b0c)),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 5.0,
                      //           ),
                      //           Text(
                      //             'Male',
                      //             style: TextStyle(
                      //               fontFamily: 'Lato',
                      //               fontSize: 12,
                      //               color: const Color(0xff000000),
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //             textAlign: TextAlign.left,
                      //           ),
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // )
                      Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 14,
                                color: const Color(0xff858585),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  activeColor: Color(0xffed2025),
                                  onChanged: (val) {
                                    print("Radio$val");
                                    setSelectedRadio(val);
                                  },
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: const Color(0xff1d1d1d),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: selectedRadio,
                                  activeColor: Color(0xffed2025),
                                  onChanged: (val) {
                                    print("Radio$val");
                                    setSelectedRadio(val);
                                  },
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: const Color(0xff1d1d1d),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Birth Date',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: size.width * 0.90,
                            height: 45.0,
                            padding: EdgeInsets.only(bottom: 5, left: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffbababa)),
                            ),
                            child: DateTimePicker(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              type: DateTimePickerType.date,
                              dateMask: 'd MMM, yyyy',
                              initialValue: birth_date.toString(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2100),
                              selectableDayPredicate: (date) {
                                // Disable weekend days to select from the calendar

                                return true;
                              },
                              onChanged: (val) {
                                print("haha ${val}");
                                setDate(val);
                              },
                              validator: (val) {
                                print("test ${val}");
                                return null;
                              },
                              onSaved: (val) => print("test ${val}"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          txtFormField(
                            height: 45.0,
                            controller: _controllerPhoneNumber..text,
                            hint: "0813",
                            keyboard_type: TextInputType.phone,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          txtFormField(
                              enabled: false,
                              controller: _controllerEmail..text,
                              height: 45.0,
                              hint: "your@mail.com",
                              keyboard_type: TextInputType.emailAddress),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Company Name',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          txtFormField(
                              controller: _controllerCompanyName..text,
                              height: 45.0,
                              hint: "Your Company Name",
                              keyboard_type: TextInputType.text),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Instagram',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          txtFormField(
                            height: 45.0,
                            controller: _controllerInstagram..text,
                            hint: "Your Instagram",
                            keyboard_type: TextInputType.text,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                  Container(
                      width: size.width * .90,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffb90b0c),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffbababa)),
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          _editProfile();
                          _editAvatar();
                        },
                        color: const Color(0xffb90b0c),
                        child: Center(
                          child: Text(
                            'SAVE CHANGES',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _editAvatar() async {
    // var data = {'image': _image};
    print(_image.path);
    ImageAPI().updateAvatar(_image.path).then((value) async {
      print(value);
    });
  }

  void _editProfile() async {
    var data = {
      'name': _controllerFullName.text.toString(),
      'email': _controllerEmail.text.toString(),
      'gender': selectedRadio.toString(),
      'birth_date': birth_date,
      'phone_number': _controllerPhoneNumber.text.toString(),
      'company_name': _controllerCompanyName.text.toString(),
      'social_instagram': _controllerInstagram.text.toString(),
    };

    // print(data);
    UserApi().editProfile(data).then((value) async {
      print(value);
      UserApi().showUser().then((value) {
        print("haha ${value.name}");
        context.bloc<UserCubit>().getUser(value);
      });
      Dialogs().showLoadingDialog(context);
      if (value['message'] != null) {
        Fluttertoast.showToast(
            msg: "${value}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);
      } else {
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ));
          Fluttertoast.showToast(
              msg: "Update Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 14.0);
        });
      }
      // print(value);
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
