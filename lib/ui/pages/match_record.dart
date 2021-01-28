import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/model/CoursePair.dart';
import 'package:hgc/model/Tees.dart';
import 'package:hgc/model/member.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/Home/course_list.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';
import 'package:hgc/ui/pages/verificator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchRecord extends StatefulWidget {
  MatchRecord({Key key}) : super(key: key);

  @override
  _MatchRecordState createState() => _MatchRecordState();
}

class _MatchRecordState extends State<MatchRecord> {
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
              'Add Match Record',
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
                    child: context.bloc<MemberCubit>().member != null
                        ? Text(
                            '${(context.bloc<MemberCubit>().state as MemberLoaded).member.name}',
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
                            builder: (context) => Verificator(),
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
                    child: context.bloc<CourseCubit>().course != null
                        ? Text(
                            '${context.bloc<CourseCubit>().course.name}',
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
                            builder: (context) => CourseList(
                              title: title,
                            ),
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
                          'SELECT COURSE',
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: context.bloc<CourseCubit>().course != null
                            ? Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FutureBuilder(
                                        future: CoursesApi().showCoursePair(
                                            context
                                                .bloc<CourseCubit>()
                                                .course
                                                .id),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Center(
                                              child: Text("${snapshot.error}"),
                                            );
                                          } else if (snapshot.hasData) {
                                            List<CoursePair> course_pair =
                                                snapshot.data;
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: course_pair.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var pair =
                                                        course_pair[index];
                                                    return Row(
                                                      children: [
                                                        Radio(
                                                          value: pair.id,
                                                          groupValue:
                                                              selectedRadio,
                                                          activeColor:
                                                              Color(0xffed2025),
                                                          onChanged: (val) {
                                                            print("Radio$val");
                                                            setSelectedRadio(
                                                                val);
                                                          },
                                                        ),
                                                        Text(
                                                          '${pair.name}',
                                                          style: TextStyle(
                                                            fontFamily: 'Lato',
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xff000000),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 22.0,
                                                ),
                                                Text(
                                                  'Tees',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xff858585),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                Container(
                                                  child: selectedRadio == 0
                                                      ? Container()
                                                      : Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                var contain = course_pair.firstWhere(
                                                                    (element) =>
                                                                        element
                                                                            .id ==
                                                                        selectedRadio);
                                                                List<Tees>
                                                                    list_tees =
                                                                    contain
                                                                        .tees;
                                                                var test;
                                                                var listtile =
                                                                    list_tees
                                                                        .forEach(
                                                                            (element) {
                                                                  test =
                                                                      element;
                                                                });
                                                                return ListView
                                                                    .builder(
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount:
                                                                      list_tees
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    var pair =
                                                                        list_tees[
                                                                            index];
                                                                    return Row(
                                                                      children: [
                                                                        Radio(
                                                                          value:
                                                                              pair.id,
                                                                          groupValue:
                                                                              selectedRadio2,
                                                                          activeColor:
                                                                              Color(0xffed2025),
                                                                          onChanged:
                                                                              (val) {
                                                                            print("Radio$val");
                                                                            setSelectedRadio2(val);
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          '${pair.name}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                const Color(0xff000000),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                var data = {
                                                                  'pair_id':
                                                                      "318",
                                                                  'golf_id': context
                                                                      .bloc<
                                                                          CourseCubit>()
                                                                      .course
                                                                      .id
                                                                      .toString(),
                                                                  'course_pair_id':
                                                                      selectedRadio
                                                                          .toString(),
                                                                  'tees_id':
                                                                      selectedRadio2
                                                                          .toString(),
                                                                };

                                                                print(data);

                                                                // context
                                                                //     .bloc<
                                                                //         MatchCubit>()
                                                                //     .createMatch(
                                                                //         data)
                                                                //     .then(
                                                                //         (value) {
                                                                //   print(
                                                                //       "ini value $value");
                                                                // });

                                                                MatchApi()
                                                                    .createMatch(
                                                                        data)
                                                                    .then(
                                                                        (value) {
                                                                  if (value[
                                                                          'data'] !=
                                                                      null) {
                                                                    Fluttertoast.showToast(
                                                                        msg:
                                                                            "${value}",
                                                                        toastLength:
                                                                            Toast
                                                                                .LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity
                                                                                .BOTTOM,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .grey,
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        fontSize:
                                                                            14.0);

                                                                    MatchApi()
                                                                        .showMatchDetail(value['data']
                                                                            [
                                                                            'id'])
                                                                        .then(
                                                                            (value) {
                                                                      print(
                                                                          value);
                                                                      context
                                                                          .bloc<
                                                                              MatchCubit>()
                                                                          .getMatch(
                                                                              value);
                                                                    });
                                                                    Future.delayed(
                                                                        const Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MatchScore(
                                                                              match_id: value['data']['id'],
                                                                            ),
                                                                          ));
                                                                    });
                                                                  } else if (value[
                                                                          'errors'] !=
                                                                      null) {
                                                                    Fluttertoast.showToast(
                                                                        msg:
                                                                            "${value['errors']}",
                                                                        toastLength:
                                                                            Toast
                                                                                .LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity
                                                                                .BOTTOM,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .grey,
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        fontSize:
                                                                            14.0);
                                                                  } else {
                                                                    Fluttertoast.showToast(
                                                                        msg:
                                                                            "${value['message']}",
                                                                        toastLength:
                                                                            Toast
                                                                                .LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity
                                                                                .BOTTOM,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .grey,
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        fontSize:
                                                                            14.0);
                                                                  }
                                                                });
                                                              },
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 20,
                                                                        bottom:
                                                                            80),
                                                                width:
                                                                    size.width *
                                                                        90,
                                                                height: 45.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  color: const Color(
                                                                      0xff3cd970),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    'CONTINUE',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      fontSize:
                                                                          16,
                                                                      color: const Color(
                                                                          0xff000000),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                    ],
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
