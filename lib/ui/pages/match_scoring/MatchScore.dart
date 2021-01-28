import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/match_scoring/AddScore.dart';
import 'package:hgc/ui/pages/match_scoring/MatchSummary.dart';
import 'package:hgc/ui/widgets/Dialog/Discard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchScore extends StatefulWidget {
  int match_id;

  MatchScore({
    this.match_id,
  });

  @override
  _MatchScoreState createState() => _MatchScoreState();
}

class _MatchScoreState extends State<MatchScore> {
  // var split;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, top: 10),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                              color: const Color(0xffb90b0c)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Discard(
                                title: "Warning",
                                description: "Discard this match?",
                                buttonText: "Okay",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Match Score',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 25,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 151,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0d000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 25, top: 22, right: 25),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Match Id',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '#${widget.match_id}',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Tee',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.teesName}',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Course Rating',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.courseRating}',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Slope Rating',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.slopeRating}',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            height: 204,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0d000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 25, top: 22, right: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${context.bloc<MatchCubit>().matches.scores[0].courseName}',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 17.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Slope Rating',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '0/9',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Total Score',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.scores[0].totalScore}',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CoursesApi()
                                          .showDetailCourse(context
                                              .bloc<MatchCubit>()
                                              .matches
                                              .golfId)
                                          .then((value) {
                                        print(value);
                                        context
                                            .read<ScoreCubit>()
                                            .getCourseScore(value);
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddScore(
                                              split1: "test",
                                              split2: "test",
                                              id_match_player: context
                                                  .bloc<MatchCubit>()
                                                  .matches
                                                  .id,
                                              id_score: context
                                                  .bloc<MatchCubit>()
                                                  .matches
                                                  .scores[0]
                                                  .id,
                                              course_name: context
                                                  .bloc<MatchCubit>()
                                                  .matches
                                                  .scores[0]
                                                  .courseName,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: const Color(0xffb90b0c),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD SCORE',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 204,
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0d000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 25, top: 22, right: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${context.bloc<MatchCubit>().matches.scores[1].courseName}',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 17.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Slope Rating',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '0/9',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Total Score',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.scores[1].totalScore}',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddScore(
                                              split1: "test",
                                              split2: "test",
                                              id_match_player: context
                                                  .bloc<MatchCubit>()
                                                  .matches
                                                  .id,
                                              id_score: context
                                                  .bloc<MatchCubit>()
                                                  .matches
                                                  .scores[1]
                                                  .id,
                                              course_name: context
                                                  .bloc<MatchCubit>()
                                                  .matches
                                                  .scores[1]
                                                  .courseName,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: const Color(0xffb90b0c),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD SCORE',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              MatchApi()
                                  .submitMatch(
                                      context.read<MatchCubit>().matches.id)
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: "${value}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 14.0);
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MatchSummary(),
                                  ));
                            },
                            child: Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xff3cd970),
                              ),
                              child: Center(
                                child: Text(
                                  'SUBMIT AND VIEW SUMMARY',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Discard(
                                  title: "Warning",
                                  description: "Discard this match?",
                                  buttonText: "Okay",
                                ),
                              );
                            },
                            child: Container(
                              height: 45.0,
                              margin: EdgeInsets.only(bottom: 70),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffaf00),
                              ),
                              child: Center(
                                child: Text(
                                  'DISCARD MATCH',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
