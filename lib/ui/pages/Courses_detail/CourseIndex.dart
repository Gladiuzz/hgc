import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/ui/pages/sign_in.dart';

class CourseIndex extends StatefulWidget {
  CourseIndex({Key key}) : super(key: key);

  @override
  _CourseIndexState createState() => _CourseIndexState();
}

class _CourseIndexState extends State<CourseIndex> {
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
                          width: size.width,
                          height: 54.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x0d000000),
                                offset: Offset(0, 3),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  'South Course - North Course',
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                            ),
                          ),
                          child: DataTable(
                            columnSpacing: 23,
                            headingRowColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              return const Color(0xfff8f8f8);
                            }),
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Text('Tees'),
                              ),
                              DataColumn(
                                label: Text('Course Rating'),
                              ),
                              DataColumn(
                                label: Text('Slope Rating'),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              4,
                              (index) => DataRow(
                                color: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  // All rows will have the same selected color.
                                  if (states.contains(MaterialState.selected)) {
                                    return Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(1);
                                  }
                                  // Even rows will have a grey color.
                                  if (index % 2 == 0) {
                                    return Colors.white;
                                  }
                                  return const Color(
                                      0xfff8f8f8); // Use default value for other states and odd rows.
                                }),
                                cells: <DataCell>[
                                  DataCell(Text('$index')),
                                  DataCell(Text('365.00')),
                                  DataCell(Text('155.00')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
