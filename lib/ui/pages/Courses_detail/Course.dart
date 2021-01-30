import 'dart:async';

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
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class Course extends StatefulWidget {
  String title;

  Course({this.title});

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<Courses> filtered_course = List();

  bool _hasMore;
  int pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 20;
  List<Courses> _course = List();
  final int _nextPageThreshold = 5;

  Future<List<Courses>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Courses(
        name: "${search}",
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _hasMore = true;
    pageNumber = 1;
    _error = false;
    _loading = true;
    filtered_course = _course;
    showCourse();
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
                  Container(
                    width: size.width * 0.90,
                    height: 37.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd8d8d8)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.only(bottom: 15, left: 14),
                        hintText: "Select Course",
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: const Color(0xff9a9a9a),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        _debouncer.run(() {
                          setState(() {
                            print("Berhasil");
                            filtered_course = _course
                                .where((element) => (element.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase())))
                                .toList();
                          });
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Builder(
                    builder: (context) {
                      if (filtered_course.isEmpty) {
                        if (_loading) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ));
                        } else if (_error) {
                          return Center(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                _loading = true;
                                _error = false;
                                showCourse();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                  "Error while loading Course, tap to try again"),
                            ),
                          ));
                        }
                      } else {
                        return Container(
                            margin: EdgeInsets.only(bottom: 100.0),
                            child: _buildListView());
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .68,
      margin: EdgeInsets.only(bottom: 50),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: filtered_course.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          Courses arena = filtered_course[index];
          if (index == filtered_course.length - _nextPageThreshold) {
            showCourse();
          }
          if (index == filtered_course.length) {
            if (_error) {
              return Center(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    _loading = true;
                    _error = false;
                    showCourse();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Error while loading Course, tap to try again"),
                ),
              ));
            } else {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }
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

  showCourse() async {
    final String request = "https://halogolfclub.com";
    Client client = Client();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    final response = await client
        .get("$request/api/golf-courses?page=${pageNumber}", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    try {
      var data = courseFromJson(response.body);

      setState(() {
        _hasMore = data.length == _defaultPhotosPerPageCount;
        _loading = false;
        pageNumber = pageNumber + 1;
        _course.addAll(data);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
