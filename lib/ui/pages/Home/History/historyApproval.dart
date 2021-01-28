import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/pair_cubit.dart';
import 'package:hgc/model/Pair.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/InboxAPI.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/Inbox/PairSummary.dart';
import 'package:hgc/ui/pages/forgot_password.dart';
import 'package:hgc/ui/pages/match_scoring/MatchSummary.dart';
import 'package:hgc/ui/pages/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryApproval extends StatefulWidget {
  @override
  _HistoryApprovalState createState() => _HistoryApprovalState();
}

class _HistoryApprovalState extends State<HistoryApproval> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

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
              FutureBuilder(
                future: MatchApi().showMatchApproved(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<Pair> match = snapshot.data;
                    return _buildListView(match);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
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

  Widget _buildListView(List<Pair> match) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: match.length,
          itemBuilder: (context, index) {
            Pair matches = match[index];
            return Builder(
              builder: (context) {
                if (matches.statusDisplay == "Approved") {
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
                              Text(
                                '${matches.statusDisplay}',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  color: const Color(0xff3cd970),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          InkWell(
                            onTap: () {
                              InboxAPI()
                                  .getInboxDetail(matches.id)
                                  .then((value) {
                                print(value);
                                context.bloc<PairCubit>().getPair(value);
                              });
                              Future.delayed(const Duration(milliseconds: 2000),
                                  () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PairSummary(),
                                    ));
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
                } else {
                  return Container();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
