import 'dart:async';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/model/bookings.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/service/BookingAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/ui/pages/Tournament/TournamentDetail.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:hgc/ui/widgets/txtsearchfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tournament extends StatefulWidget {
  Tournament({Key key}) : super(key: key);

  @override
  _TournamentState createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
  ScrollController _scrollController;
  final _debouncer = Debouncer(milliseconds: 500);
  List<Tournamentss> tournaments = List();
  List<Tournamentss> filtered_tournaments = List();
  DateFormat dateFormat;

  Future<List<Tournamentss>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Tournamentss(
        name: "${search}",
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    TournamentApi().showTournament().then((tournamentOnServer) {
      setState(() {
        tournaments = tournamentOnServer;
        filtered_tournaments = tournamentOnServer;
        filtered_tournaments.sort((a, b) => a.date.compareTo(b.date));
        // filtered_tournaments.sort((a,b) => a.)
      });
    });
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
          body: Container(
            width: size.width,
            height: size.height,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      hintText: "Select Tournament",
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
                          filtered_tournaments = tournaments
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
                  height: 20,
                ),
                FutureBuilder(
                  future: TournamentApi().showTournament(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Terjadi Kesalahab"),
                      );
                    } else if (snapshot.hasData) {
                      List<Tournamentss> tournament = snapshot.data;
                      return _buildListView(filtered_tournaments);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<Tournamentss> tournament) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tournament.length,
          itemBuilder: (context, index) {
            Tournamentss turnament = tournament[index];
            DateTime tempDate = DateFormat("yyyy-MM-dd").parse(turnament.date);
            return GestureDetector(
              onTap: () {
                context.bloc<BookingsCubit>().removeDetailBooking();

                BookingApi().showBookedTournament().then((value) {
                  print("bookingan ${value}");
                  context.bloc<BookingsCubit>().getActiveTournament(value);
                });
                TournamentApi()
                    .showDetailTournament(turnament.id)
                    .then((value) {
                  context.bloc<TournamentCubit>().getDetailTournament(value);
                  print(context
                      .bloc<TournamentCubit>()
                      .detail_tournament
                      .data
                      .booking
                      .id);

                  var list = context.bloc<BookingsCubit>().book;

                  List<Book> contains_tournament = list
                      .where((element) => element.id
                          .toString()
                          .contains(turnament.id.toString()))
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
                          tournaments:
                              context.bloc<TournamentCubit>().detail_tournament,
                        ),
                      ));
                });
              },
              child: Column(
                children: [
                  Container(
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
                              image: NetworkImage('${turnament.image}'),
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
                                      '${turnament.name}',
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
                                    height: 18,
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
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Dialogs().showLoadingDialog(context);
                                  TournamentApi()
                                      .showDetailTournament(turnament.id)
                                      .then((value) {
                                    context
                                        .bloc<TournamentCubit>()
                                        .getDetailTournament(value);
                                  });
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
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
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
