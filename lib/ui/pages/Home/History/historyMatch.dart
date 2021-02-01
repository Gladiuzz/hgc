import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/forgot_password.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';
import 'package:hgc/ui/pages/match_scoring/MatchSummary.dart';
import 'package:hgc/ui/pages/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryMatch extends StatefulWidget {
  @override
  _HistoryMatchState createState() => _HistoryMatchState();
}

class _HistoryMatchState extends State<HistoryMatch> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool _hasMore;
  int pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 10;
  List<Matches> _match = List();
  final int _nextPageThreshold = 5;
  var test;

  @override
  void initState() {
    super.initState();
    _hasMore = true;
    pageNumber = 1;
    _error = false;
    _loading = true;
    showMatches();
  }

  Future refreshData() async {
    showMatches();
  }

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Builder(
                builder: (context) {
                  if (_match.isEmpty) {
                    if (_loading) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ));
                    } else if (_error) {
                      return Center(
                          child: InkWell(
                        onTap: () {
                          setState(() {
                            _loading = true;
                            _error = false;
                            showMatches();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                              "Error while loading Matches, tap to try again"),
                        ),
                      ));
                    }
                  } else {
                    return _buildListView();
                  }
                  return Container();
                },
              ),
              SizedBox(
                height: 180,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Expanded(
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _match.length + (_hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              Matches matches = _match[index];
              if (index == _match.length - _nextPageThreshold) {
                showMatches();
              }
              if (index == _match.length) {
                if (_error) {
                  return Center(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _loading = true;
                        _error = false;
                        showMatches();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                          Text("Error while loading Member, tap to try again"),
                    ),
                  ));
                } else {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircularProgressIndicator(),
                  ));
                }
              }
              return Container(
                width: 374,
                height: 239,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0d000000),
                      offset: Offset(0, 3),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Text(
                          'Match ID ${matches.id}',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Date',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '${matches.createdAtDisplay}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Course Name',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '${matches.golfName}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total Score',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '${matches.totalScore}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Status',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Builder(
                            builder: (context) {
                              if (matches.statusDisplay == "Playing") {
                                return Text(
                                  '${matches.statusDisplay}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xff2698dd),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                );
                              } else if (matches.statusDisplay == "Approved") {
                                return Text(
                                  '${matches.statusDisplay}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xff3cd970),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                );
                              } else {
                                return Text(
                                  '${matches.statusDisplay}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xffe88d15),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                );
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          // _showDetailHistory();
                          MatchApi()
                              .showMatchDetail(matches.id)
                              .then((value) async {
                            print(value);
                            context.bloc<MatchCubit>().getMatch(value);
                            Future.delayed(const Duration(milliseconds: 2000),
                                () {
                              if (context
                                      .bloc<MatchCubit>()
                                      .matches
                                      .statusDisplay ==
                                  "Playing") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MatchScore(),
                                    ));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MatchSummary(),
                                    ));
                              }
                            });
                          });
                        },
                        child: Container(
                          width: size.width * 0.90,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffb90b0c),
                          ),
                          child: Center(
                            child: Text(
                              'VIEW DETAIL',
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showDetailHistory() async {
    Dialogs().showLoadingDialog(context);
  }

  showMatches() async {
    final String request = "https://halogolfclub.com";
    Client client = Client();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    final response = await client
        .get("$request/api/matches/v2?page=${pageNumber}", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    try {
      var data = json.decode(response.body);
      var matches = List<Matches>.from(
          data['data'].map((item) => Matches.fromJson(item)));

      setState(() {
        _hasMore = matches.length == _defaultPhotosPerPageCount;
        _loading = false;
        pageNumber = pageNumber + 1;
        _match.addAll(matches);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }

    // if (response.statusCode == 200) {
    //   print(response.body);
    //   var data = json.decode(response.body);

    //   //  List<Matches> value = Matches.fromJson(data['data']);

    //   return List<Matches>.from(
    //       data['data'].map((item) => Matches.fromJson(item)));
    // } else {
    //   print(response.body);
    //   var data = matchFromJson(response.body);
    //   return data;
    // }
  }
}
