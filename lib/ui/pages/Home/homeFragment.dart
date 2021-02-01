import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/cubit/record_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/model/golfCourse.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/model/user.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/service/HandicapAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Courses_detail/Course.dart';
import 'package:hgc/ui/pages/Courses_detail/courseDetail.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/Tournament/Tournament.dart';
import 'package:hgc/ui/pages/Tournament/TournamentDetail.dart';
import 'package:hgc/ui/pages/match_record.dart';

class HomeFragment extends StatefulWidget {
  HomeFragment({Key key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  var handicap;
  User users;

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
                  height: 800,
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
                                  if (context.bloc<RecordCubit>().records !=
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
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                gradient: LinearGradient(
                                                  begin: Alignment(1.0, 0.0),
                                                  end: Alignment(-1.0, 0.0),
                                                  colors: [
                                                    const Color(0xffa4d700),
                                                    const Color(0xff346e0d)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TournamentDetail(
                        tournaments: turnament,
                      ),
                    ));
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
