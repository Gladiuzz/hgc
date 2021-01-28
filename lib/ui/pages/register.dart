import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/sign_in.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedRadio;
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  final TextEditingController full_name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone_number = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController repeat_password = new TextEditingController();

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
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Registration',
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
              margin: EdgeInsets.only(left: 30, right: 30, top: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          color: const Color(0xff858585),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: size.width,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffbababa)),
                        ),
                        child: TextFormField(
                          controller: full_name,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 5, left: 14),
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff9a9a9a),
                            ),
                            border: InputBorder.none,
                          ),
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
                    children: [
                      Container(
                        width: size.width * 0.80,
                        child: Text(
                          'Gender',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            color: const Color(0xff858585),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
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
                  SizedBox(
                    height: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          color: const Color(0xff858585),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: size.width,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffbababa)),
                        ),
                        child: TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 5, left: 14),
                            hintText: "Email@mail.com",
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff9a9a9a),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          color: const Color(0xff858585),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: size.width,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffbababa)),
                        ),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 14, top: 10),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: const Color(0xff9a9a9a),
                              ),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglevisibility();
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.red,
                                ),
                              )),
                          validator: (val) =>
                              val.length < 8 ? 'Password too short.' : null,
                          obscureText: !_showPassword,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Repeat Password',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          color: const Color(0xff858585),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: size.width,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffbababa)),
                        ),
                        child: TextFormField(
                          controller: repeat_password,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 14, top: 10),
                              hintText: "Repeat Password",
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: const Color(0xff9a9a9a),
                              ),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglevisibility();
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.red,
                                ),
                              )),
                          validator: (val) =>
                              val.length < 8 ? 'Password too short.' : null,
                          obscureText: !_showPassword,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 42.0,
                  ),
                  Container(
                      width: size.width * 0.90,
                      height: 40,
                      margin: EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xffb90b0c),
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          _register();
                          // var body = json.decode(res);
                          // print(body);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SignInPage(),
                          //     ));
                        },
                        color: Color(0xffb90b0c),
                        child: Center(
                          child: Text(
                            'REGISTER',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    String nama = "hasin";

    var data = {
      'name': full_name.text.toString(),
      'email': email.text.toString(),
      'role_id': "5",
      'password': password.text.toString(),
      'password_confirmation': repeat_password.text.toString(),
      'gender': selectedRadio.toString(),
    };

    // print(data);
    UserApi().register(data).then((value) async {
      print(value);
      Fluttertoast.showToast(
          msg: "$value",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 14.0);
      // print(value);
    });
  }
}
