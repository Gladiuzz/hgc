import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/leaderboard_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/cubit/verificators_cubit.dart';
import 'package:hgc/model/bookings.dart';
import 'package:hgc/model/golfCourse.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/model/user.dart';
import 'package:hgc/service/BookingAPI.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/service/HandicapAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Courses_detail/Course.dart';
import 'package:hgc/ui/pages/Courses_detail/courseDetail.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/Tournament/Tournament.dart';
import 'package:hgc/ui/pages/Tournament/TournamentDetail.dart';
import 'package:hgc/ui/pages/Tournament/TournamentLeaderboard.dart';
import 'package:hgc/ui/pages/Tournament/TournamentMatch.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';

class HomeFragment extends StatefulWidget {
  HomeFragment({Key key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  var handicap;
  User users;
  var now = new DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future refreshData() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var dn = DateTime(now.year, now.month, now.day);
    var dn2 = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    // DateTime tempDate = DateFormat("yyyy-MM-dd")
    //     .parse(context.bloc<BookingsCubit>().book.data[0].dateTimezone);
    // DateTime tempDate2 = DateFormat("yyyy-MM-dd HH:mm")
    //     .parse(context.bloc<BookingsCubit>().book.data[0].dateTimezone);
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xffffffff),
              title: Container(
                margin: EdgeInsets.only(left: 2),
                child: Image.asset(
                  'assets/images/06_ic_login.png',
                  width: 44,
                  height: 44,
                ),
              )),
          body: RefreshIndicator(
            onRefresh: refreshData,
            child: SingleChildScrollView(
              child: Container(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: size.width * 0.90,
                          height: 386.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                width: 97.0,
                                height: 97.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                  image: context.bloc<UserCubit>().user.image !=
                                          null
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              '${context.bloc<UserCubit>().user.image}'),
                                          fit: BoxFit.cover,
                                        )
                                      : DecorationImage(
                                          image: AssetImage(
                                              'assets/images/default_avatar.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                width: 173.0,
                                child: Text(
                                  '${context.bloc<UserCubit>().user.name}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Builder(
                                builder: (context) {
                                  if (context.bloc<UserCubit>().user.handicap ==
                                      null) {
                                    return Text(
                                      'Current Handicap: -',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 14,
                                        color: const Color(0xffb90b0c),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  } else {
                                    return Text(
                                      'Current Handicap: ${context.bloc<UserCubit>().user.handicap}',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 14,
                                        color: const Color(0xffb90b0c),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              SizedBox(
                                width: 192.0,
                                child: Text(
                                  'Here\'s your latest record',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    color: const Color(0xff858585),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Builder(
                                builder: (context) {
                                  if (context
                                          .bloc<RecordCubit>()
                                          .records
                                          .data
                                          .match
                                          .golfName !=
                                      null) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Course Name',
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                width: 180.0,
                                                child: Text(
                                                  '${context.bloc<RecordCubit>().records.data.match.golfName}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Pair Name',
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                width: 180.0,
                                                child: Text(
                                                  '${context.bloc<RecordCubit>().records.data.match.pairName}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.0,
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
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                width: 180.0,
                                                child: Text(
                                                  '${context.bloc<RecordCubit>().records.data.match.totalScore}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .bloc<MemberCubit>()
                                                  .removeVerificator();
                                              context
                                                  .bloc<CourseCubit>()
                                                  .removeCourse();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchRecord(),
                                                  ));
                                            },
                                            child: Container(
                                              width: size.width,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/empty_btn.png")),
                                              ),
                                              child: Center(
                                                child: SizedBox(
                                                  width: 98.0,
                                                  child: Text(
                                                    'LET\'S PLAY',
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
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Course Name',
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                width: 180.0,
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Pair Name',
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                width: 180.0,
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.0,
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
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                width: 180.0,
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .bloc<MemberCubit>()
                                                  .removeVerificator();
                                              context
                                                  .bloc<CourseCubit>()
                                                  .removeCourse();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchRecord(),
                                                  ));
                                            },
                                            child: Container(
                                              width: size.width,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/empty_btn.png")),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'PLAY REGULAR MATCH',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xffffffff),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Builder(
                      //   builder: (context) {
                      //     if (tempDate.compareTo(dn) == 0) {
                      //       return Container(
                      //         width: size.width * 0.90,
                      //         height: 275.0,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10.0),
                      //           color: const Color(0xffffffff),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: const Color(0x29000000),
                      //               offset: Offset(0, 0),
                      //               blurRadius: 15,
                      //             ),
                      //           ],
                      //         ),
                      //         child: Container(
                      //           margin: EdgeInsets.only(
                      //               left: 25, right: 25, top: 20),
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: <Widget>[
                      //               Text(
                      //                 'Active Tournament',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Lato',
                      //                   fontSize: 14,
                      //                   color: const Color(0xffb90b0c),
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //                 textAlign: TextAlign.left,
                      //               ),
                      //               SizedBox(
                      //                 height: 5.0,
                      //               ),
                      //               Text(
                      //                 '${context.bloc<BookingsCubit>().book.data[0].name}',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Lato',
                      //                   fontSize: 18,
                      //                   color: const Color(0xff000000),
                      //                   fontWeight: FontWeight.w700,
                      //                 ),
                      //                 textAlign: TextAlign.left,
                      //               ),
                      //               SizedBox(
                      //                 height: 17,
                      //               ),
                      //               Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: <Widget>[
                      //                   Text(
                      //                     'Course Name',
                      //                     style: TextStyle(
                      //                       fontFamily: 'Lato',
                      //                       fontSize: 14,
                      //                       color: const Color(0xffbababa),
                      //                       fontWeight: FontWeight.w500,
                      //                     ),
                      //                     textAlign: TextAlign.left,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 180.0,
                      //                     child: Text(
                      //                       'Royale Jakarta Golf Club',
                      //                       style: TextStyle(
                      //                         fontFamily: 'Lato',
                      //                         fontSize: 14,
                      //                         color: const Color(0xff000000),
                      //                         fontWeight: FontWeight.w500,
                      //                       ),
                      //                       textAlign: TextAlign.right,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 8,
                      //               ),
                      //               Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: <Widget>[
                      //                   Text(
                      //                     'Verificator Name',
                      //                     style: TextStyle(
                      //                       fontFamily: 'Lato',
                      //                       fontSize: 14,
                      //                       color: const Color(0xffbababa),
                      //                       fontWeight: FontWeight.w500,
                      //                     ),
                      //                     textAlign: TextAlign.left,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 180.0,
                      //                     child: Text(
                      //                       'Project CL',
                      //                       style: TextStyle(
                      //                         fontFamily: 'Lato',
                      //                         fontSize: 14,
                      //                         color: const Color(0xff000000),
                      //                         fontWeight: FontWeight.w500,
                      //                       ),
                      //                       textAlign: TextAlign.right,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 20,
                      //               ),
                      //               InkWell(
                      //                 onTap: () {
                      //                   Dialogs().showLoadingDialog(context);
                      //                   TournamentApi()
                      //                       .showDetailTournament(context
                      //                           .bloc<BookingsCubit>()
                      //                           .book
                      //                           .data[0]
                      //                           .id)
                      //                       .then((value) {
                      //                     context
                      //                         .bloc<TournamentCubit>()
                      //                         .getDetailTournament(value);
                      //                     context
                      //                         .bloc<VerificatorsCubit>()
                      //                         .removeVerificator();
                      //                   });
                      //                   Future.delayed(
                      //                       const Duration(milliseconds: 2000),
                      //                       () {
                      //                     Navigator.pop(context);
                      //                     Navigator.push(
                      //                         context,
                      //                         MaterialPageRoute(
                      //                           builder: (context) =>
                      //                               TournamentMatch(),
                      //                         ));
                      //                   });
                      //                 },
                      //                 child: Container(
                      //                   width: size.width,
                      //                   height: 45.0,
                      //                   decoration: BoxDecoration(
                      //                     borderRadius:
                      //                         BorderRadius.circular(5.0),
                      //                     image: DecorationImage(
                      //                         image: AssetImage(
                      //                             "assets/images/tournament_btn.png")),
                      //                   ),
                      //                   child: Center(
                      //                     child: SizedBox(
                      //                       width: 259.0,
                      //                       child: Text(
                      //                         'PLAY TOURNAMENT MATCH',
                      //                         style: TextStyle(
                      //                           fontFamily: 'Lato',
                      //                           fontSize: 16,
                      //                           color: const Color(0xffffffff),
                      //                           fontWeight: FontWeight.w700,
                      //                         ),
                      //                         textAlign: TextAlign.center,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 10,
                      //               ),
                      //               InkWell(
                      //                 onTap: () {
                      //                   Dialogs().showLoadingDialog(context);
                      //                   TournamentApi()
                      //                       .tournamentLeaderboard(context
                      //                           .bloc<BookingsCubit>()
                      //                           .book
                      //                           .data[0]
                      //                           .id)
                      //                       .then((value) {
                      //                     print(value);
                      //                     context
                      //                         .bloc<LeaderboardCubit>()
                      //                         .getLeaderboard(value);
                      //                     Future.delayed(
                      //                         const Duration(
                      //                             milliseconds: 1000), () {
                      //                       Navigator.pop(context);
                      //                       Navigator.push(
                      //                           context,
                      //                           MaterialPageRoute(
                      //                             builder: (context) =>
                      //                                 TournamentLeaderBoard(),
                      //                           ));
                      //                     });
                      //                   });
                      //                 },
                      //                 child: Container(
                      //                   width: size.width,
                      //                   height: 45.0,
                      //                   decoration: BoxDecoration(
                      //                     borderRadius:
                      //                         BorderRadius.circular(5.0),
                      //                     image: DecorationImage(
                      //                         image: AssetImage(
                      //                             "assets/images/leaderboard_btn.png")),
                      //                   ),
                      //                   child: Center(
                      //                     child: SizedBox(
                      //                       width: 194.0,
                      //                       child: Text(
                      //                         'VIEW LEADERBOARD',
                      //                         style: TextStyle(
                      //                           fontFamily: 'Lato',
                      //                           fontSize: 16,
                      //                           color: const Color(0xffffffff),
                      //                           fontWeight: FontWeight.w700,
                      //                         ),
                      //                         textAlign: TextAlign.center,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     } else {
                      //       return Container();
                      //     }
                      //   },
                      // ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Tournament',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Tournament(),
                                    ));
                              },
                              child: Text(
                                'More',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  color: const Color(0xffb90b0c),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      FutureBuilder(
                        future: TournamentApi().showTournament(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("${snapshot.error}"),
                            );
                          } else if (snapshot.hasData) {
                            List<Tournamentss> tournament = snapshot.data;
                            return _buildListView(tournament);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Courses',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Course(),
                                    ));
                              },
                              child: Text(
                                'More',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  color: const Color(0xffb90b0c),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      FutureBuilder(
                        future: CoursesApi().showCourses(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("${snapshot.error}"),
                            );
                          } else if (snapshot.hasData) {
                            List<Coursesz> courses = snapshot.data;
                            return _buildListView2(courses);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<Tournamentss> tournament) {
    tournament.sort((b, a) => a.date.compareTo(b.date));
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 110,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tournament.length,
          itemBuilder: (BuildContext context, int index) {
            Tournamentss turnament = tournament[index];
            return InkWell(
              onTap: () {
                BookingApi().showBookedTournament().then((value) {
                  print("bookingan ${value}");
                  context.bloc<BookingsCubit>().getActiveTournament(value);
                });
                TournamentApi()
                    .showDetailTournament(turnament.id)
                    .then((value) {
                  context.bloc<TournamentCubit>().getDetailTournament(value);
                  print(context
                      .bloc<TournamentCubit>()
                      .detail_tournament
                      .data
                      .booking
                      .id);

                  var list = context.bloc<BookingsCubit>().book;

                  List<Book> contains_tournament = list
                      .where((element) => element.id
                          .toString()
                          .contains(turnament.id.toString()))
                      .toList();

                  // print(contains_tournament[0]);

                  BookingApi()
                      .bookedDetail(contains_tournament[0].booking.id)
                      .then((value) {
                    print("ejkl ${value}");
                    context.bloc<BookingsCubit>().getDetailBooking(value);
                  });

                  // context.bloc<BookingsCubit>().book.data.where((element) => false)
                  // context.bloc<BookingsCubit>().book.data.forEach((element) {});
                });
                Dialogs().showLoadingDialog(context);
                // // TournamentApi()
                // //     .showDetailTournament(turnament.id)
                // //     .then((value) {
                // //   context.bloc<TournamentCubit>().getDetailTournament(value);
                // // });

                Future.delayed(const Duration(milliseconds: 1500), () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TournamentDetail(
                          tournaments:
                              context.bloc<TournamentCubit>().detail_tournament,
                        ),
                      ));
                });
              },
              child: Container(
                width: size.width * 0.70,
                height: 145.0,
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage("${turnament.image}"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0d000000),
                      offset: Offset(0, 0),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildListView2(List<Coursesz> course) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 100.0,
      child: ListView.builder(
          itemCount: course.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Coursesz courses = course[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetail(
                        courses: courses,
                      ),
                    ));
              },
              child: Container(
                width: 250.0,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xfffefefe),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0d000000),
                      offset: Offset(0, 0),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 7.5,
                    ),
                    Container(
                      width: 64.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('${courses.image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.35,
                          child: Text(
                            '${courses.name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '${courses.location.cityName}',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            color: const Color(0xff858585),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
