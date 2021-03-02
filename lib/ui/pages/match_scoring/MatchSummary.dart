import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/model/Score.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/Home/History/history.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/Home/homeFragment.dart';
import 'package:hgc/ui/pages/match_scoring/AddScore.dart';
import 'package:hgc/ui/pages/match_scoring/MatchRevised.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs_revise.dart';
import 'package:hgc/ui/widgets/Dialog/Discard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchSummary extends StatefulWidget {
  Matches matches;
  MatchSummary({this.matches});

  @override
  _MatchSummaryState createState() => _MatchSummaryState();
}

class _MatchSummaryState extends State<MatchSummary> {
  var split, match;
  @override
  void initState() {
    // TODO: implement initState
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
                            print(context
                                .bloc<MatchCubit>()
                                .matches
                                .statusDisplay);
                            if (context
                                    .bloc<MatchCubit>()
                                    .matches
                                    .statusDisplay !=
                                "Approved") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Discard(
                                  title: "Warning",
                                  description: "Discard this match?",
                                  buttonText: "Okay",
                                  match: context.bloc<MatchCubit>().matches,
                                ),
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ));
                            }
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
                              'Match Summary',
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
                            height: 174,
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
                                    '${context.bloc<MatchCubit>().matches.golfName}',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Match ID',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '#${context.bloc<MatchCubit>().matches.id}',
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
                                        'Date',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.createdAt}',
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
                                        'Player Name',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.userName}',
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
                                        'Verificator Name',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${context.bloc<MatchCubit>().matches.pairName}',
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
                            height: 20.0,
                          ),
                          Builder(
                            builder: (context) {
                              if (context
                                      .bloc<MatchCubit>()
                                      .matches
                                      .statusDisplay !=
                                  "playable") {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        margin: EdgeInsets.only(
                                            left: 25, top: 22, right: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Your Score',
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  '${context.bloc<MatchCubit>().matches.scores[0].courseName}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '${context.bloc<MatchCubit>().matches.scores[0].totalScore}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  '${context.bloc<MatchCubit>().matches.scores[1].courseName}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '${context.bloc<MatchCubit>().matches.scores[1].totalScore}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 28.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (context
                                                .bloc<UserCubit>()
                                                .user
                                                .name !=
                                            context
                                                .bloc<MatchCubit>()
                                                .matches
                                                .userName) {
                                          return SizedBox(
                                            width: size.width,
                                            height: 44.0,
                                            child: Text(
                                              'By clicking approve, you agree that both you and your pair score are correct.',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15,
                                                color: const Color(0xff858585),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          );
                                        } else if (context
                                                .bloc<MatchCubit>()
                                                .matches
                                                .statusDisplay ==
                                            "Approved") {
                                          return Container();
                                        } else {
                                          return SizedBox(
                                            width: size.width,
                                            height: 44.0,
                                            child: Text(
                                              'Your Score have not been approved. Please wait for the verification to approve your scores.',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15,
                                                color: const Color(0xff858585),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (context
                                                .bloc<UserCubit>()
                                                .user
                                                .name !=
                                            context
                                                .bloc<MatchCubit>()
                                                .matches
                                                .userName) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        DialogsRevise(
                                                      match: context
                                                          .bloc<MatchCubit>()
                                                          .matches,
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: size.width * 0.4,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color:
                                                        const Color(0xffb90b0c),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'REVISE',
                                                      style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontSize: 16,
                                                        color: const Color(
                                                            0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(),
                                                      ));
                                                },
                                                child: Container(
                                                  width: size.width * 0.4,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color:
                                                        const Color(0xff3cd970),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'APPROVE',
                                                      style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontSize: 16,
                                                        color: const Color(
                                                            0xff000000),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ));
                                      },
                                      child: Container(
                                        width: size.width,
                                        height: 45.0,
                                        margin: EdgeInsets.only(bottom: 80),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: const Color(0xff2698dd),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'BACK TO HOME',
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
                                    )
                                  ],
                                );
                              } else {
                                return Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: size.width,
                                      height: 204,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        margin: EdgeInsets.only(
                                            left: 25, top: 22, right: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Slope Rating',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '0/9',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Total Score',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '${context.bloc<MatchCubit>().matches.scores[0].totalScore}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
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
                                                      builder: (context) =>
                                                          AddScore(),
                                                    ));
                                              },
                                              child: Container(
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color:
                                                      const Color(0xffb90b0c),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'ADD SCORE',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontSize: 16,
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        margin: EdgeInsets.only(
                                            left: 25, top: 22, right: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Slope Rating',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '0/9',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'Total Score',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  '${context.bloc<MatchCubit>().matches.scores[1].totalScore}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
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
                                                      builder: (context) =>
                                                          AddScore(),
                                                    ));
                                              },
                                              child: Container(
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color:
                                                      const Color(0xffb90b0c),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'ADD SCORE',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontSize: 16,
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MatchSummary(),
                                            ));
                                      },
                                      child: Container(
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
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
                                          builder: (BuildContext context) =>
                                              Discard(
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
                                          borderRadius:
                                              BorderRadius.circular(5.0),
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
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
