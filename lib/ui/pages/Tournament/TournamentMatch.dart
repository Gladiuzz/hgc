import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/cubit/verificators_cubit.dart';
import 'package:hgc/model/CoursePair.dart';
import 'package:hgc/model/Tees.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/Home/course_list.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/Tournament/TournamentVerificator.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';

import '../verificator.dart';

class TournamentMatch extends StatefulWidget {
  TournamentMatch({Key key}) : super(key: key);

  @override
  _TournamentMatchState createState() => _TournamentMatchState();
}

class _TournamentMatchState extends State<TournamentMatch> {
  String title = "Select Course";
  Widget navigator;
  int selectedRadio;
  int selectedRadio2;
  bool _isLoading = false;

  var _character;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadio2 = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadio2(int val) {
    setState(() {
      selectedRadio2 = val;
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
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  )),
            ),
            title: Text(
              'Add Match Records',
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Verificator',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    child:
                        context.bloc<VerificatorsCubit>().verificators != null
                            ? Text(
                                '${(context.bloc<VerificatorsCubit>().state as VerificatorsLoaded).verificator.name}',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              )
                            : Text(
                                '-',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  color: const Color(0xff858585),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TournamentVerificator(),
                          ));
                    },
                    child: Container(
                      width: 374.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffaf00),
                      ),
                      child: Center(
                        child: Text(
                          'SELECT VERIFICATOR',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Container(
                    child: Text(
                      'Course',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    child: Text(
                      '${context.bloc<TournamentCubit>().detail_tournament.data.golfName}',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Course Pair',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: const Color(0xff858585),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future: CoursesApi().showCoursePair(context
                                .bloc<TournamentCubit>()
                                .detail_tournament
                                .data
                                .golfId),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("${snapshot.error}"),
                                );
                              } else if (snapshot.hasData) {
                                List<CoursePair> course_pair = snapshot.data;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: course_pair.length,
                                      itemBuilder: (context, index) {
                                        var pair = course_pair[index];
                                        return Row(
                                          children: [
                                            Radio(
                                              value: pair.id,
                                              groupValue: selectedRadio,
                                              activeColor: Color(0xffed2025),
                                              onChanged: (val) {
                                                print("Radio$val");
                                                setSelectedRadio(val);
                                              },
                                            ),
                                            Text(
                                              '${pair.name}',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 14,
                                                color: const Color(0xff000000),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Tees',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      color: const Color(0xff858585),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 17.0,
                  ),
                  Container(
                    child: context.bloc<UserCubit>().user.gender == 1
                        ? Text(
                            '${context.bloc<TournamentCubit>().detail_tournament.data.tees.male.name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          )
                        : Text(
                            '${context.bloc<TournamentCubit>().detail_tournament.data.tees.female.name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Builder(
                    builder: (context) {
                      if (selectedRadio != 0) {
                        return GestureDetector(
                          onTap: () {
                            makeTournamentMatch();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20, bottom: 80),
                            width: size.width * 90,
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xff3cd970),
                            ),
                            child: Center(
                              child: Text(
                                'CONTINUE',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void makeTournamentMatch() async {
    Dialogs().showLoadingDialog(context);

    var gender_tees;
    if (context.bloc<UserCubit>().user.gender == 1) {
      gender_tees = context
          .bloc<TournamentCubit>()
          .detail_tournament
          .data
          .tees
          .male
          .id
          .toString();
    } else {
      gender_tees = context
          .bloc<TournamentCubit>()
          .detail_tournament
          .data
          .tees
          .female
          .id
          .toString();
    }
    var data = {
      'pair_id': context.bloc<VerificatorsCubit>().verificators.id.toString(),
      'golf_id': context
          .bloc<TournamentCubit>()
          .detail_tournament
          .data
          .golfId
          .toString(),
      'course_pair_id': selectedRadio.toString(),
      'tees_id': gender_tees.toString(),
    };

    print(data);

    if (context.bloc<VerificatorsCubit>().verificators.id == null) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "The Pair Member field is required.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 14.0);
    } else if (selectedRadio == null) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "The Course Pair field is required.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 14.0);
    } else {
      MatchApi()
          .createMatchTournament(
              data, context.bloc<TournamentCubit>().detail_tournament.data.id)
          .then((value) {
        Fluttertoast.showToast(
            msg: "A match has been created",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);

        MatchApi().showMatchDetail(value['data']['id']).then((value) {
          print(value);
          context.bloc<MatchCubit>().getMatch(value);
        });

        Future.delayed(const Duration(milliseconds: 2000), () {
          setState(() {
            Navigator.pop(context);
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchScore(
                  match_id: value['data']['id'],
                ),
              ));
        });
      });
    }
  }
}
