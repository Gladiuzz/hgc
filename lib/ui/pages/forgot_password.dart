import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/sign_in.dart';

class Forgot_Password extends StatefulWidget {
  Forgot_Password({Key key}) : super(key: key);

  @override
  _Forgot_PasswordState createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  final TextEditingController email = new TextEditingController();

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
              'Forget Password',
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
                  SizedBox(
                    width: size.width,
                    child: Text(
                      'Enter your email address and we will send you link to reset your password to your email address',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Email Address',
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
                    height: 15.0,
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
                          forgot_password();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SignInPage(),
                          //     ));
                        },
                        color: Color(0xffb90b0c),
                        child: Center(
                          child: Text(
                            'NEXT',
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

  void forgot_password() async {
    var data = {
      'email': email.text.toString(),
    };

    UserApi().forgotPassword(data).then((value) async {
      print(value);

      if (value['errors'] != null) {
        print('gagal mengirim reset link');
        Fluttertoast.showToast(
            msg: "${value['errors']['email'][0]}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);
      } else {
        Fluttertoast.showToast(
            msg: "${value['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ));
      }
    });
  }
}
