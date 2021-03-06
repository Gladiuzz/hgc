import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hgc/model/tournamentDetail.dart';
import 'package:hgc/model/tournament_model.dart';

class TournamentAbout extends StatefulWidget {
  Tournament_detail tournamentss;
  TournamentAbout({this.tournamentss});

  @override
  _TournamentAboutState createState() => _TournamentAboutState();
}

class _TournamentAboutState extends State<TournamentAbout> {
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
            'About the Event',
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
          SizedBox(
            width: 350.0,
            child: SingleChildScrollView(
              child: Html(
                data: """${widget.tournamentss.data.description}""",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
