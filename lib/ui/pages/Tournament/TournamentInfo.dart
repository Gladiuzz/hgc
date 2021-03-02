import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/service/GolfCourseAPI.dart';
import 'package:hgc/ui/pages/Courses_detail/courseDetail.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';

class TournamentInfo extends StatefulWidget {
  TournamentInfo({Key key}) : super(key: key);

  @override
  _TournamentInfoState createState() => _TournamentInfoState();
}

class _TournamentInfoState extends State<TournamentInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tournament Info',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 17,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Golf Course',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: const Color(0xff858585),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 181.0,
                child: Text(
                  '${context.bloc<TournamentCubit>().detail_tournament.data.golfName}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(),
              GestureDetector(
                onTap: () {
                  Dialogs().showLoadingDialog(context);
                  CoursesApi()
                      .showDetailCourses(context
                          .bloc<TournamentCubit>()
                          .detail_tournament
                          .data
                          .golfId)
                      .then((value) {
                    print("waasa ${value}");
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseDetail(
                              courses: value,
                            ),
                          ));
                    });
                  });
                },
                child: SizedBox(
                  width: 114.0,
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: const Color(0xff2698dd),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Male Tee',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: const Color(0xff858585),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 181.0,
                child: Text(
                  '${context.bloc<TournamentCubit>().detail_tournament.data.tees.male.name}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Female Tee',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: const Color(0xff858585),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 181.0,
                child: Text(
                  '${context.bloc<TournamentCubit>().detail_tournament.data.tees.female.name}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Organizer',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: const Color(0xff858585),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 181.0,
                child: Text(
                  '${context.bloc<TournamentCubit>().detail_tournament.data.organizerName}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
