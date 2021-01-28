import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';

class EditPassword extends StatefulWidget {
  EditPassword({Key key}) : super(key: key);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerNewPassword = TextEditingController();
  TextEditingController _controllerNewConfirm = TextEditingController();

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
              'Change Password',
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
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Column(
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
                          width: size.width * .90,
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffbababa)),
                          ),
                          child: TextFormField(
                            controller: _controllerPassword,
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
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'New Password',
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
                          width: size.width * .90,
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffbababa)),
                          ),
                          child: TextFormField(
                            controller: _controllerNewPassword,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 14, top: 10),
                                hintText: "New Password",
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
                          height: 12,
                        ),
                        Text(
                          'New Password Confirmation',
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
                          width: size.width * .90,
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffbababa)),
                          ),
                          child: TextFormField(
                            controller: _controllerNewConfirm,
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
                        SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
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
                          _changePassword();
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
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changePassword() async {
    var data = {
      'current_password': _controllerPassword.text.toString(),
      'password': _controllerNewPassword.text.toString(),
      'password_confirmation': _controllerNewConfirm.text.toString(),
    };

    UserApi().changePassword(data).then((value) async {
      print(value);
      if (value['message'] == "Success.") {
        Fluttertoast.showToast(
            msg: "${value.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      } else {
        Fluttertoast.showToast(
            msg: "${value.toString()}",
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
