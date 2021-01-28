import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/service/ScoreAPI.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';

class DirectScore extends StatefulWidget {
  var id_score, id_match_player;

  DirectScore({
    this.id_score,
    this.id_match_player,
  });

  @override
  _DirectScoreState createState() => _DirectScoreState();
}

class _DirectScoreState extends State<DirectScore> {
  final TextEditingController score = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width,
        height: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xffffffff),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Type your total score for this course\nare below',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: size.width * 0.70,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffbababa)),
                  ),
                  child: TextFormField(
                    controller: score,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10, left: 14),
                      hintText: "Your Score",
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xff9a9a9a),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Container(),
                      Container(),
                      Text(
                        'CLOSE',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          color: const Color(0xff858585),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          scoreSkip();
                        },
                        child: Text(
                          'SAVE SCORE',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scoreSkip() {
    var data = {'total_score': score.text.toString()};

    ScoreApi()
        .createScoreSkip(data, widget.id_match_player, widget.id_score)
        .then((value) {
      print(value);

      Fluttertoast.showToast(
          msg: "${value}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 14.0);

      MatchApi().showMatchDetail(widget.id_match_player).then((values) {
        context.bloc<MatchCubit>().getMatch(values);
        print(context.bloc<MatchCubit>().matches.id);
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchScore(
                  match_id: context.bloc<MatchCubit>().matches.id,
                ),
              ));
        });
      });
    });
  }
}
