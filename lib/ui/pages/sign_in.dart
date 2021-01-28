import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/model/user.dart';
import 'package:hgc/service/RecordAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/forgot_password.dart';
import 'package:hgc/ui/pages/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  width: 126.0,
                  height: 132.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/06_ic_login.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email (Username)',
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
                    width: size.width * 0.90,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffbababa)),
                    ),
                    child: TextFormField(
                      controller: email,
                      onEditingComplete: () => node.nextFocus(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 10, left: 14),
                        hintText: "Email",
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
                height: 11.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    width: size.width * 0.90,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffbababa)),
                    ),
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 14),
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      width: size.width * 0.90,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xffb90b0c),
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          // print('test');
                          _login();
                        },
                        color: Color(0xffb90b0c),
                        child: Center(
                          child: Text(
                            'LOGIN',
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
                    height: 20.0,
                  ),
                  Container(
                    width: size.width * 0.90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ));
                          },
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              color: const Color(0xffb90b0c),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.string(
                            '<svg viewBox="208.0 607.5 1.0 14.0" ><path transform="translate(208.03, 607.5)" d="M 0 0 L 0 14" fill="none" stroke="#b90b0c" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forgot_Password(),
                                ));
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 13,
                              color: const Color(0xffb90b0c),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    var data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    // print(data);
    // User user = User(
    //   email: email.text.toString(),
    //   password: password.text.toString(),
    // );

    // print(user);

    // await context
    //     .bloc<UserCubit>()
    //     .signIn(email.text.toString(), password.text.toString());
    // UserState state = context.bloc<UserCubit>().state;

    // print(state);

    // if (state is UserLoaded) {
    //   print('berhasil');
    // } else {
    //   print('gagal');
    // }
    Dialogs().showLoadingDialog(context);

    UserApi()
        .login(email.text.toString(), password.text.toString())
        .then((value) async {
      print(value);
      // print(value['token']);

      if (value['token'] != null) {
        print("Berhasil Login");
        // UserApi().getToken(value['token']);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', value['token']);
        print(localStorage.getString('token'));
        setState(() {
          UserApi().showUser().then((value) {
            print("haha ${value.name}");
            context.bloc<UserCubit>().getUser(value);
          });
          RecordApi().showRecord().then((value) {
            print("record ${value}");
            context.bloc<RecordCubit>().getRecord(value);
          });

          Future.delayed(const Duration(milliseconds: 3000), () {
            setState(() {
              Navigator.pop(context);
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ));
          });
        });
      } else if (value['message'] != null) {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "${value}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);
      }
    });
  }
}
