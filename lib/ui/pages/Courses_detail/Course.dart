import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/model/golfCourse.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/ui/pages/Courses_detail/CourseInfo.dart';
import 'package:hgc/ui/pages/Courses_detail/Courses.dart';
import 'package:hgc/ui/pages/Courses_detail/courseDetail.dart';
import 'package:hgc/ui/pages/Home/homeFragment.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:hgc/ui/pages/onboarding.dart';
import 'package:hgc/ui/pages/sign_in.dart';
import 'package:hgc/ui/widgets/txtsearchfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Course extends StatefulWidget {
  String title;

  Course({this.title});

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomeFragment(),
    SignInPage(),
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
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  txtsearchfield(
                    height: 37.0,
                    hint: "Select City",
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    padding: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                    ),
                    child: FutureBuilder(
                      future: CoursesApi().showCourses(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else if (snapshot.hasData) {
                          List<Courses> course = snapshot.data;
                          return _buildListView(course);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
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

  Widget _buildListView(List<Courses> course) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(bottom: 50),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: course.length,
        itemBuilder: (context, index) {
          Courses arena = course[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetail(
                          courses: arena,
                        ),
                      ));
                },
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${arena.image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${arena.name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '${arena.city_name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
