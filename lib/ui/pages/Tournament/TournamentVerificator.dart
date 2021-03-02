import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/cubit/verificators_cubit.dart';
import 'package:hgc/model/tournamentDetail.dart';
import 'package:hgc/model/verificators.dart';
import 'package:hgc/ui/pages/Tournament/TournamentMatch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_bloc/flutter_bloc.dart';

class TournamentVerificator extends StatefulWidget {
  TournamentVerificator({Key key}) : super(key: key);

  @override
  _TournamentVerificatorState createState() => _TournamentVerificatorState();
}

class _TournamentVerificatorState extends State<TournamentVerificator> {
  ScrollController _scrollController;
  final _debouncer = Debouncer(milliseconds: 500);
  List<Verificators_tournament> filtered_member;

  bool _hasMore;
  int pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 10;
  List<Verificators_tournament> _member = List();
  final int _nextPageThreshold = 5;
  var test;

  Future<List<Verificators_tournament>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Verificators_tournament(
        name: "${search}",
      );
    });
  }

  Future refreshData() async {
    showMember(context.bloc<TournamentCubit>().detail_tournament.data.id);
  }

  @override
  void initState() {
    super.initState();
    showMember(context.bloc<TournamentCubit>().detail_tournament.data.id);
    _scrollController = ScrollController();
    _hasMore = true;
    pageNumber = 1;
    _error = false;
    _loading = true;
    _member.sort((a, b) => a.name.compareTo(b.name));
    filtered_member = _member;
    filtered_member.sort((a, b) => a.name.compareTo(b.name));
    print("ws ${_member}");
  }

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
              'Select Verificator',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                color: const Color(0xffb90b0c),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width * 0.90,
                  height: 37.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(bottom: 15, left: 14),
                      hintText: "Select Member/Partner",
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: const Color(0xff9a9a9a),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _debouncer.run(() {
                        setState(() {
                          print("Berhasil");
                          filtered_member = _member
                              .where((element) => (element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase())))
                              .toList();
                        });
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Builder(
                  builder: (context) {
                    if (filtered_member.isEmpty) {
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
                              showMember(context
                                  .bloc<TournamentCubit>()
                                  .detail_tournament
                                  .data
                                  .id);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                                "Error while loading Verificator, tap to try again"),
                          ),
                        ));
                      }
                    } else {
                      return _buildListView();
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: refreshData,
      child: Container(
        width: size.width,
        height: size.height * .79,
        child: ListView.builder(
          itemCount: filtered_member.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            Verificators_tournament user = filtered_member[index];
            if (index == filtered_member.length - _nextPageThreshold) {
              showMember(
                  context.bloc<TournamentCubit>().detail_tournament.data.id);
            }
            if (index == filtered_member.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      showMember(context
                          .bloc<TournamentCubit>()
                          .detail_tournament
                          .data
                          .id);
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
                InkWell(
                  onTap: () {
                    context
                        .bloc<VerificatorsCubit>()
                        .getTournamentVerificator(user);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TournamentMatch(),
                        ));
                  },
                  child: Container(
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
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }

  showMember(id) async {
    final String request = "https://halogolfclub.com";
    Client client = Client();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    final response = await client.get(
        "$request/api/tournaments/${id}/verificators?page=${pageNumber}",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    try {
      var data = json.decode(response.body);

      var value = List<Verificators_tournament>.from(
          data['data'].map((item) => Verificators_tournament.fromJson(item)));

      setState(() {
        _hasMore = value.length == _defaultPhotosPerPageCount;
        _loading = false;
        pageNumber = pageNumber + 1;
        _member.addAll(value);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
