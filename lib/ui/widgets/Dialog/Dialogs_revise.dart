import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/pair_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/InboxAPI.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/service/ScoreAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';

class DialogsRevise extends StatefulWidget {
  var match;

  DialogsRevise({
    this.match,
  });

  @override
  _DialogsReviseState createState() => _DialogsReviseState();
}

class _DialogsReviseState extends State<DialogsRevise> {
  final TextEditingController note = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width,
        height: 220.0,
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
                  'Type your note why you revise the match',
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
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffbababa)),
                  ),
                  child: TextFormField(
                    controller: note,
                    keyboardType: TextInputType.text,
                    maxLines: 8,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(bottom: 10, left: 14, top: 12),
                      hintText: "Input your note",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CLOSE',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            color: const Color(0xff858585),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          rejectMatch();
                        },
                        child: Text(
                          'SUBMIT',
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

  void rejectMatch() {
    Dialogs().showLoadingDialog(context);
    var data = {'note': note.text.toString()};

    InboxAPI()
        .rejectMatch(context.bloc<PairCubit>().pairs.data.id, data)
        .then((value) {
      print(value);
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "${value['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      });
    });
  }
}
