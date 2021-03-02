import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/course_pair_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/cubit/scorecourse_cubit.dart';
import 'package:hgc/model/golfCourse.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/ui/pages/Courses_detail/CourseDistance.dart';
import 'package:hgc/ui/pages/Courses_detail/CourseIndex.dart';
import 'package:hgc/ui/pages/Courses_detail/CourseInfo.dart';
import 'package:hgc/ui/pages/Courses_detail/Courses.dart';
import 'package:hgc/ui/pages/Home/History/history.dart';
import 'package:hgc/ui/pages/Home/homeFragment.dart';
import 'package:hgc/ui/pages/onboarding.dart';
import 'package:hgc/ui/pages/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetail extends StatefulWidget {
  Coursesz courses;
  CourseDetail({this.courses});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomeFragment(),
    History(),
    Onboarding(),
    Onboarding(),
    Onboarding()
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _pageController.jumpToPage(selectedIndex);
    });
  }

  void getDetailCourse() async {
    setState(() {
      CoursesApi().showDetailCourse(widget.courses.id).then((value) {});
    });
  }

  void getDetailCoursesScore() async {
    CoursesApi().showDetailCourse(widget.courses.id).then((value) {
      context.bloc<ScoreCubit>().getCourseScore(value);
    });
    CoursesApi().showCoursePair(widget.courses.id).then((value) {
      context.bloc<CoursePairCubit>().getCoursePair(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailCoursesScore();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          titleSpacing: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: const Color(0xffb90b0c)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Course List',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18,
              color: const Color(0xffb90b0c),
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          bottom: TabBar(
            indicatorColor: const Color(0xffb90b0c),
            tabs: [
              Tab(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(
                        child: Center(
                            child: Text(
                          "Info",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xffb90b0c),
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      )),
                    ]),
              ),
              Tab(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(
                        child: Center(
                            child: Text(
                          "Courses",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xffb90b0c),
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      )),
                    ]),
              ),
              Tab(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(
                        child: Center(
                            child: Text(
                          "Distance",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xffb90b0c),
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      )),
                    ]),
              ),
              Tab(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(
                        child: Center(
                            child: Text(
                          "Course Index",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xffb90b0c),
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      )),
                    ]),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CourseInfo(
              courses: widget.courses,
            ),
            Coursess(courses: widget.courses),
            CourseDistance(),
            CourseIndex(),
          ],
        ),
      ),
    );
  }
}
