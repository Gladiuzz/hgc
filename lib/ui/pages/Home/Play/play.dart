import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/ui/pages/Home/course_list.dart';
import 'package:hgc/ui/pages/match_record.dart';
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
import 'package:hgc/service/RecordAPI.dart';
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

class Play extends StatefulWidget {
  Play({Key key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  var handicap;
  User users;
  var now = new DateTime.now();
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            automaticallyImplyLeading: false,
            title: Text(
              'Play',
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
                              image:
                                  context.bloc<UserCubit>().user.image != null
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
                                      .match !=
                                  null) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                                              color: const Color(0xffbababa),
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
                                                color: const Color(0xff000000),
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
                                              color: const Color(0xffbababa),
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
                                                color: const Color(0xff000000),
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
                                              color: const Color(0xffbababa),
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
                                                color: const Color(0xff000000),
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
                                          print(context
                                              .bloc<BookingsCubit>()
                                              .book);
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
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontWeight: FontWeight.w700,
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
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                                              color: const Color(0xffbababa),
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
                                                color: const Color(0xff000000),
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
                                              color: const Color(0xffbababa),
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
                                                color: const Color(0xff000000),
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
                                              color: const Color(0xffbababa),
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
                                                color: const Color(0xff000000),
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
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Builder(
                    builder: (context) {
                      BookingApi().showBookedTournament().then((value) {
                        print("bookingan ${value}");
                        context
                            .bloc<BookingsCubit>()
                            .getActiveTournament(value);
                      });

                      var list = context.bloc<BookingsCubit>().book;

                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(now);

                      // print(list[1].dateTimezone.toString());
                      // print(formattedDate);

                      print("wtf ${list}");

                      String test;

                      List<Book> contains_tournament;

                      contains_tournament = list.where((element) {
                        dateTime = DateTime.parse(element.dateTimezone);
                        String td = DateFormat("yyyy-MM-dd").format(dateTime);
                        bool tests = td.contains(formattedDate);

                        return tests;
                      }).toList();

                      print("wtf2 ${contains_tournament}");
                      // print(
                      //     "wtf2 ${DateFormat("yyyy-MM-dd").format(dateTime).toString()}");

                      if (list.isNotEmpty &&
                          DateFormat("yyyy-MM-dd")
                                  .format(dateTime)
                                  .toString()
                                  .compareTo(formattedDate) ==
                              0 &&
                          contains_tournament[0].booking.statusDisplay ==
                              "Reserved" &&
                          contains_tournament.isNotEmpty &&
                          DateFormat("yyyy-MM-dd")
                              .format(dateTime)
                              .toString()
                              .isNotEmpty &&
                          contains_tournament[0] != null &&
                          list.isNotEmpty &&
                          dateTime != null &&
                          contains_tournament[0].booking.status == 1) {
                        return Container(
                          width: size.width * 0.90,
                          height: 275.0,
                          margin: EdgeInsets.only(bottom: 20),
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
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 25, right: 25, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Active Tournament',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xffb90b0c),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${contains_tournament[0].name}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Course Name',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 14,
                                        color: const Color(0xffbababa),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      width: 180.0,
                                      child: Text(
                                        'Royale Jakarta Golf Club',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
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
                                        color: const Color(0xffbababa),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      width: 180.0,
                                      child: Text(
                                        'Project CL',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Dialogs().showLoadingDialog(context);
                                    TournamentApi()
                                        .showDetailTournament(
                                            contains_tournament[0].id)
                                        .then((value) {
                                      context
                                          .bloc<TournamentCubit>()
                                          .getDetailTournament(value);
                                      context
                                          .bloc<VerificatorsCubit>()
                                          .removeVerificator();
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 2000), () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TournamentMatch(),
                                          ));
                                    });
                                  },
                                  child: Container(
                                    width: size.width,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/tournament_btn.png")),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: 259.0,
                                        child: Text(
                                          'PLAY TOURNAMENT MATCH',
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
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Dialogs().showLoadingDialog(context);
                                    TournamentApi()
                                        .tournamentLeaderboard(
                                            contains_tournament[0].id)
                                        .then((value) {
                                      print(value);
                                      context
                                          .bloc<LeaderboardCubit>()
                                          .getLeaderboard(value);
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TournamentLeaderBoard(),
                                            ));
                                      });
                                    });
                                  },
                                  child: Container(
                                    width: size.width,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/leaderboard_btn.png")),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: 194.0,
                                        child: Text(
                                          'VIEW LEADERBOARD',
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
                                ),
                              ],
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
}
