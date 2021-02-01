import 'package:adobe_xd/pinned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/cubit/scorecourse_cubit.dart';
import 'package:hgc/model/ScoreCourse.dart';
import 'package:hgc/ui/widgets/Dialog/Direct_score.dart';
import 'package:hgc/ui/widgets/Dialog/Discard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScore extends StatefulWidget {
  String split1, split2;
  var id_score, id_match_player, course_name;
  AddScore({
    this.split1,
    this.split2,
    this.id_score,
    this.id_match_player,
    this.course_name,
  });

  @override
  _AddScoreState createState() => _AddScoreState();
}

class _AddScoreState extends State<AddScore> {
  var total_score;
  var totals;
  static const int numItems = 9;
  List<bool> selected = List<bool>.generate(numItems, (index) => false);

  @override
  void initState() {
    super.initState();
    total_score = context.bloc<ScorecourseCubit>().scoreCourse.data.totalScore;
  }

  Map<String, int> score = {};

  void scorePerHole(id_hole, value) {
    totals = 0;
    context.bloc<ScorecourseCubit>().scoreCourse.data.holes.forEach((element) {
      totals += element.score;
      print(totals);
    });

    return totals;
  }

  TextEditingController _controllerTotalScore = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
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
              '${widget.course_name} Score',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width,
                        child: DataTable(
                          columnSpacing: 14,
                          showBottomBorder: false,
                          headingRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return const Color(0xfff8f8f8);
                          }),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Hole',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Par',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            DataColumn(
                              label: Text('Index'),
                            ),
                            DataColumn(
                              label: Text('Distance'),
                            ),
                            DataColumn(
                              label: Text('Total Score'),
                            ),
                          ],
                          rows: context
                              .bloc<ScorecourseCubit>()
                              .scoreCourse
                              .data
                              .holes
                              .map(
                                (index) => DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    // All rows will have the same selected color.
                                    if (states.contains(MaterialState.selected))
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5);
                                    // Even rows will have a grey color.
                                    if (index.id % 2 == 0) {
                                      return Colors.white;
                                    }
                                    return const Color(
                                        0xfff8f8f8); // Use default value for other states and odd rows.
                                  }),
                                  cells: <DataCell>[
                                    DataCell(Text('# ${index.index}')),
                                    DataCell(Text('${index.par}')),
                                    DataCell(Text('${index.handicap}')),
                                    DataCell(Text('${index.distance}')),
                                    DataCell(
                                      Container(
                                        width: 51.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: const Color(0xffffffff),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xffbababa)),
                                        ),
                                        child: TextFormField(
                                          maxLength: 2,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                              color: const Color(0xff9a9a9a),
                                            ),
                                            border: InputBorder.none,
                                            counterText: "",
                                          ),
                                          onEditingComplete: () =>
                                              node.nextFocus(),
                                          onChanged: (value) {
                                            index.score = int.parse(value);
                                            scorePerHole(index.id, value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 39,
                    decoration: BoxDecoration(
                        color: numItems % 2 == 0
                            ? Colors.white
                            : const Color(0xfff8f8f8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(),
                        Container(),
                        Container(),
                        Center(
                          child: Container(
                            child: Text(
                              'Total',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 14,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          width: 51.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffbababa)),
                          ),
                          child: totals == null
                              ? TextFormField(
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  controller: _controllerTotalScore..text = "",
                                )
                              : TextFormField(
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  controller: _controllerTotalScore
                                    ..text = totals.toString(),
                                ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .90,
                    height: 45.0,
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xff3cd970),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => DirectScore(
                          id_match_player: widget.id_match_player,
                          id_score: widget.id_score,
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * .90,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffb90b0c),
                      ),
                      child: Center(
                        child: Text(
                          'DIRECT TO TOTAL SCORE',
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
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
