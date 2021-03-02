import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/model/CourseScore.dart';
import 'package:hgc/ui/pages/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDistance extends StatefulWidget {
  CourseDistance({Key key}) : super(key: key);

  @override
  _CourseDistanceState createState() => _CourseDistanceState();
}

class _CourseDistanceState extends State<CourseDistance> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (index) => false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              margin: EdgeInsets.only(left: 20, right: 20, top: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      return _buildListView(
                          context.bloc<ScoreCubit>().coursescore.data);
                    },
                  ),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<CourseScoreData> courseScore) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: courseScore.length,
        itemBuilder: (context, index) {
          CourseScoreData datas = courseScore[index];
          return Column(
            children: [
              Card(
                elevation: 1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 54.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              '${datas.name} (in meter)',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 20,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      child: DataTable(
                        showBottomBorder: false,
                        columnSpacing: 17,
                        headingRowColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return const Color(0xfff8f8f8);
                        }),
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text('Hole'),
                          ),
                          DataColumn(
                            label: Text('Black'),
                          ),
                          DataColumn(
                            label: Text('Blue'),
                          ),
                          DataColumn(
                            label: Text('White'),
                          ),
                          DataColumn(
                            label: Text('Red'),
                          ),
                        ],
                        rows: datas.holes
                            .map(
                              (index) => DataRow(
                                color: MaterialStateProperty.resolveWith<Color>(
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
                                  DataCell(Text('${index.index}')),
                                  DataCell(Text('${index.tees[0].distance}')),
                                  DataCell(Text('${index.tees[1].distance}')),
                                  DataCell(Text('${index.tees[2].distance}')),
                                  DataCell(Text('${index.tees[3].distance}')),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
