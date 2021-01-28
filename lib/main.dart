import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/cubit/pair_cubit.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/ui/pages/onboarding.dart';

void main() {
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

  void _incrementCounter() {
    setState(() {
      _counter++;
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Halo Golf Tracker',
        home: Onboarding(),
      ),
    );
  }
}
