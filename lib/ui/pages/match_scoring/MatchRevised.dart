import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/ui/pages/match_scoring/AddScore.dart';
import 'package:hgc/ui/pages/match_scoring/MatchSummary.dart';
import 'package:hgc/ui/widgets/Dialog/Discard.dart';

class MatchRevise extends StatefulWidget {
  MatchRevise({Key key}) : super(key: key);

  @override
  _MatchReviseState createState() => _MatchReviseState();
}

class _MatchReviseState extends State<MatchRevise> {
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
                          onPressed: () => Navigator.of(context).pop(),
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
                                        '#14',
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
                                        'Tees',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Black',
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
                                        '75.70',
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
                                        '143',
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
                            height: 131,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffd9dc),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0d000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 25, top: 21),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Revised Reason',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      color: const Color(0xffb90b0c),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Revised reason text here',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                      color: const Color(0xff000000),
                                    ),
                                    textAlign: TextAlign.left,
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
                                    'North Course',
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
                                        '0',
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
                                            builder: (context) => AddScore(),
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
                                    'South Course',
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
                                        '0',
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
                                            builder: (context) => AddScore(),
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
                              margin: EdgeInsets.only(bottom: 30),
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
