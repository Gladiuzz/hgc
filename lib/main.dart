import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/course_pair_cubit.dart';
import 'package:hgc/cubit/leaderboard_cubit.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/cubit/pair_cubit.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/cubit/scorecourse_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/cubit/verificators_cubit.dart';
import 'package:hgc/service/RecordAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/SplashScreen/SplashScreen.dart';
import 'package:hgc/ui/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isAuth = false;
  var token;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _message = '';

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // _checkIfLoggedIn() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   token = localStorage.getString('token');
  //   var duration = new Duration(seconds: 4);
  //   print(token);
  //   if (token != null) {
  //     setState(() {
  //       isAuth = true;
  //       return new Timer(Duration(seconds: 3), navigationPage2);
  //     });
  //   } else {
  //     print('no login');
  //     setState(() {
  //       return new Timer(duration, navigationPage1);
  //     });
  //   }
  // }

  // void navigationPage1() {
  //   Navigator.of(context).pushReplacementNamed('/onBoarding');
  // }

  // void navigationPage2() {
  //   UserApi().showUser().then((value) {
  //     print("haha ${value.name}");
  //     context.bloc<UserCubit>().getUser(value);
  //   });
  //   RecordApi().showRecord().then((value) {
  //     print("record ${value}");
  //     context.bloc<RecordCubit>().getRecord(value);
  //   });

  //   Future.delayed(const Duration(milliseconds: 3000), () {
  //     Navigator.of(context).pushReplacementNamed('/home');
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _registerOnFirebase();
    getMessage();
    // checkAuth();
    // _checkIfLoggedIn();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      setState(() => _message = message["notification"]["body"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["body"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["body"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => CourseCubit()),
        BlocProvider(
          create: (context) => MemberCubit(),
        ),
        BlocProvider(create: (context) => MatchCubit()),
        BlocProvider(create: (context) => ScoreCubit()),
        BlocProvider(create: (context) => PairCubit()),
        BlocProvider(create: (context) => RecordCubit()),
        BlocProvider(create: (context) => ScorecourseCubit()),
        BlocProvider(create: (context) => CoursePairCubit()),
        BlocProvider(create: (context) => LeaderboardCubit()),
        BlocProvider(create: (context) => BookingsCubit()),
        BlocProvider(create: (context) => TournamentCubit()),
        BlocProvider(create: (context) => VerificatorsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Halo Golf Tracker',
        home: SplashScreen(),
        routes: {
          '/onBoarding': (BuildContext context) => Onboarding(),
          '/home': (BuildContext context) => Home(),
        },
      ),
    );
  }
}
