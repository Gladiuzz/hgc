import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/ui/pages/Tournament/TournamentDetail.dart';
import 'package:hgc/ui/widgets/txtsearchfield.dart';

class Tournament extends StatefulWidget {
  Tournament({Key key}) : super(key: key);

  @override
  _TournamentState createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
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
              'Tournament',
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
              width: size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: <Widget>[
                  txtsearchfield(
                    height: 37.0,
                    hint: "Search Tournament",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 245,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 0),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 161,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/tournament.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 16, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Pride Of The Nation',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    '22 November 2020',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 11,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TournamentDetail(),
                                      ));
                                },
                                child: Container(
                                  width: size.width * .30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: const Color(0xffb90b0c),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'VIEW DETAIL',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 12,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
