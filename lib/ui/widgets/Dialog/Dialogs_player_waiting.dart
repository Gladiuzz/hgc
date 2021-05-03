import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/pair_cubit.dart';
import 'package:hgc/cubit/score_cubit.dart';
import 'package:hgc/cubit/verificators_cubit.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/model/verificators.dart';
import 'package:hgc/service/InboxAPI.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/service/ScoreAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';
import 'package:hgc/ui/pages/verificator.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DialogsPlayerWaiting extends StatefulWidget {
  var id_tournament, players;

  DialogsPlayerWaiting({this.id_tournament, this.players});

  @override
  _DialogsPlayerWaitingState createState() => _DialogsPlayerWaitingState();
}

class _DialogsPlayerWaitingState extends State<DialogsPlayerWaiting> {
  final TextEditingController note = new TextEditingController();
  ScrollController _scrollController;
  bool _hasMore;
  int pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 10;
  List<Verificators_tournament> _member = List();
  final int _nextPageThreshold = 5;
  var test;

  Future refreshData() async {
    showMember(widget.id_tournament);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _hasMore = true;
    pageNumber = 1;
    _error = false;
    _loading = true;
    // _member.sort((a, b) => a.name.compareTo(b.name));
    // filtered_member = _member;
    print("ws ${_member}");
    showMember(widget.id_tournament);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width,
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
                  'User Already Book',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Builder(
                  builder: (context) {
                    if (_member.isEmpty) {
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
                              showMember(widget.id_tournament);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                                "Error while loading user that already paid, tap to try again"),
                          ),
                        ));
                      }
                    } else {
                      return _buildListView();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    _member.sort((a, b) => a.name.compareTo(b.name));
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: refreshData,
      child: Container(
        width: size.width,
        height: size.height * .80,
        child: ListView.builder(
          itemCount: _member.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            Verificators_tournament user = _member[index];
            if (index == _member.length - _nextPageThreshold) {
              showMember(widget.id_tournament);
            }
            if (index == _member.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      showMember(widget.id_tournament);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Error while loading Member, tap to try again"),
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
            return Column(
              children: [
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      (user.image != null)
                          ? Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                image: DecorationImage(
                                  image: NetworkImage('${user.image}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/default_avatar.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${user.name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '${user.type}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xffbababa),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          },
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

  showMember(id) async {
    final String request = "https://halogolfclub.com";
    Client client = Client();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    final response = await client.get(
        "$request/api/tournaments/${id}/waiting-list?page=${pageNumber}",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    try {
      var bodyy = json.decode(response.body);
      var data = List<Verificators_tournament>.from(
          bodyy['data'].map((item) => Verificators_tournament.fromJson(item)));
      // print('hah ${data}');

      setState(() {
        _hasMore = data.length == _defaultPhotosPerPageCount;
        _loading = false;
        pageNumber = pageNumber + 1;
        _member.addAll(data);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }
}
