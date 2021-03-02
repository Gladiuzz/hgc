import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/service/BookingAPI.dart';
import 'package:hgc/service/RecordAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuth = false;

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var duration = new Duration(seconds: 2);
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
    BookingApi().showBookedTournament().then((value) {
      print("bookingan ${value}");
      context.bloc<BookingsCubit>().getActiveTournament(value);
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
