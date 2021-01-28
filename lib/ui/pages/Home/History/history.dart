import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/ui/pages/Courses_detail/CourseInfo.dart';
import 'package:hgc/ui/pages/Courses_detail/Courses.dart';
import 'package:hgc/ui/pages/Home/History/historyApproval.dart';
import 'package:hgc/ui/pages/Home/History/historyMatch.dart';
import 'package:hgc/ui/pages/Home/course_list.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text(
            'History',
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
                          "Match",
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
                          "Approval",
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
                          "Tournament",
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
            HistoryMatch(),
            HistoryApproval(),
            Container(),
          ],
        ),
      ),
    );
  }
}
