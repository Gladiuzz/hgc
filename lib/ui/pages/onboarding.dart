import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/data/data.dart';
import 'package:hgc/service/RecordAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/sign_in.dart';
import 'package:hgc/ui/widgets/SlideTile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding extends StatefulWidget {
  final Widget child;

  const Onboarding({Key key, @required this.child}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;
  bool isAuth = false;

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var duration = new Duration(seconds: 4);
    print(token);
    if (token != null) {
      setState(() {
        isAuth = true;
        return new Timer(Duration(seconds: 1), navigationPage2);
      });
    } else {
      print('no login');
      setState(() {
        return new Timer(duration, navigationPage1);
      });
    }
  }

  void navigationPage1() {
    Navigator.of(context).pushReplacementNamed('/onBoarding');
  }

  void navigationPage2() {
    UserApi().showUser().then((value) {
      print("haha ${value.name}");
      context.bloc<UserCubit>().getUser(value);
    });
    RecordApi().showRecord().then((value) {
      print("record ${value}");
      context.bloc<RecordCubit>().getRecord(value);
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xffb91209) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
    // _checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                    desc: mySLides[0].getDesc(),
                    button: Container(),
                    lewati: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'LEWATI',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16,
                            color: const Color(0xffb40300),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                    desc: mySLides[1].getDesc(),
                    button: Container(),
                    lewati: Container(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                    desc: mySLides[2].getDesc(),
                    button: Container(),
                    lewati: Container(),
                  ),
                  SlideTile(
                    imagePath: mySLides[3].getImageAssetPath(),
                    desc: mySLides[3].getDesc(),
                    lewati: Container(),
                    button: Container(
                        width: size.width * 0.70,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffb90b0c),
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          },
                          color: Color(0xffb90b0c),
                          child: Center(
                            child: Text(
                              'MULAI',
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
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
