import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/model/bookings.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/BookingAPI.dart';
import 'package:hgc/service/InboxAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/ui/pages/Tournament/TournamentDetail.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTournament extends StatefulWidget {
  HistoryTournament({Key key}) : super(key: key);

  @override
  _HistoryTournamentState createState() => _HistoryTournamentState();
}

class _HistoryTournamentState extends State<HistoryTournament> {
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
  List<Book> _match = List();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
          ],
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
              Book book = _match[index];
              DateTime tempDate =
                  DateFormat("yyyy-MM-dd").parse(book.date.toString());
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
              return GestureDetector(
                onTap: () {
                  BookingApi().showBookedTournament().then((value) {
                    print("bookingan ${value}");
                    context.bloc<BookingsCubit>().getActiveTournament(value);
                  });
                  TournamentApi().showDetailTournament(book.id).then((value) {
                    context.bloc<TournamentCubit>().getDetailTournament(value);
                    print(context
                        .bloc<TournamentCubit>()
                        .detail_tournament
                        .data
                        .booking
                        .id);

                    var list = context.bloc<BookingsCubit>().book;

                    List<Book> contains_tournament = list
                        .where((element) =>
                            element.id.toString().contains(book.id.toString()))
                        .toList();

                    // print(contains_tournament[0]);

                    BookingApi()
                        .bookedDetail(contains_tournament[0].booking.id)
                        .then((value) {
                      print("ejkl ${value}");
                      context.bloc<BookingsCubit>().getDetailBooking(value);
                    });

                    // context.bloc<BookingsCubit>().book.data.where((element) => false)
                    // context.bloc<BookingsCubit>().book.data.forEach((element) {});
                  });
                  Dialogs().showLoadingDialog(context);
                  // // TournamentApi()
                  // //     .showDetailTournament(turnament.id)
                  // //     .then((value) {
                  // //   context.bloc<TournamentCubit>().getDetailTournament(value);
                  // // });

                  Future.delayed(const Duration(milliseconds: 1500), () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TournamentDetail(
                            tournaments: context
                                .bloc<TournamentCubit>()
                                .detail_tournament,
                          ),
                        ));
                  });
                },
                child: Container(
                  width: 374,
                  height: 279,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 161,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('${book.image}'),
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
                                  Container(
                                    width: 160,
                                    child: Text(
                                      '${book.name}',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 14,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    DateFormat("dd MMMM yyyy")
                                        .format(tempDate)
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 11,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    '${book.booking.statusDisplay}',
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
                              InkWell(
                                onTap: () {
                                  BookingApi()
                                      .showBookedTournament()
                                      .then((value) {
                                    print("bookingan ${value}");
                                    context
                                        .bloc<BookingsCubit>()
                                        .getActiveTournament(value);
                                  });
                                  TournamentApi()
                                      .showDetailTournament(book.id)
                                      .then((value) {
                                    context
                                        .bloc<TournamentCubit>()
                                        .getDetailTournament(value);
                                    print(context
                                        .bloc<TournamentCubit>()
                                        .detail_tournament
                                        .data
                                        .booking
                                        .id);

                                    var list =
                                        context.bloc<BookingsCubit>().book;

                                    List<Book> contains_tournament = list
                                        .where((element) => element.id
                                            .toString()
                                            .contains(book.id.toString()))
                                        .toList();

                                    // print(contains_tournament[0]);

                                    BookingApi()
                                        .bookedDetail(
                                            contains_tournament[0].booking.id)
                                        .then((value) {
                                      print("ejkl ${value}");
                                      context
                                          .bloc<BookingsCubit>()
                                          .getDetailBooking(value);
                                    });

                                    // context.bloc<BookingsCubit>().book.data.where((element) => false)
                                    // context.bloc<BookingsCubit>().book.data.forEach((element) {});
                                  });
                                  Dialogs().showLoadingDialog(context);
                                  // // TournamentApi()
                                  // //     .showDetailTournament(turnament.id)
                                  // //     .then((value) {
                                  // //   context.bloc<TournamentCubit>().getDetailTournament(value);
                                  // // });

                                  Future.delayed(
                                      const Duration(milliseconds: 1500), () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TournamentDetail(
                                            tournaments: context
                                                .bloc<TournamentCubit>()
                                                .detail_tournament,
                                          ),
                                        ));
                                  });
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
        .get("$request/api/tournaments/bookings?page=${pageNumber}", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    try {
      var data = json.decode(response.body);
      var matches =
          List<Book>.from(data['data'].map((item) => Book.fromJson(item)));

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
