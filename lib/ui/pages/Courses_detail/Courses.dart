import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/model/golfCourse.dart';
import 'package:hgc/ui/pages/sign_in.dart';

class Coursess extends StatefulWidget {
  Coursesz courses;

  Coursess({this.courses});

  @override
  _CoursessState createState() => _CoursessState();
}

class _CoursessState extends State<Coursess> {
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                                  'South Course',
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
                                label: Text('Par'),
                              ),
                              DataColumn(
                                label: Text('Handicap'),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              numItems,
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
                                  if (index % 2 == 0) {
                                    return Colors.white;
                                  }
                                  return const Color(
                                      0xfff8f8f8); // Use default value for other states and odd rows.
                                }),
                                cells: <DataCell>[
                                  DataCell(Text('$index')),
                                  DataCell(Text('4')),
                                  DataCell(Text('17.0')),
                                ],
                                selected: selected[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
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
