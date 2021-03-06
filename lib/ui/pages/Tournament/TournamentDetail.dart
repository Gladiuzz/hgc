import 'dart:async';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/leaderboard_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/model/tournamentDetail.dart';
import 'package:hgc/model/tournament_model.dart';
import 'package:hgc/service/BookingAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/pages/Tournament/Tournament.dart';
import 'package:hgc/ui/pages/Tournament/TournamentAbout.dart';
import 'package:hgc/ui/pages/Tournament/TournamentInfo.dart';
import 'package:hgc/ui/pages/Tournament/TournamentLeaderboard.dart';
import 'package:hgc/ui/pages/Tournament/TournamentPay.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TournamentDetail extends StatefulWidget {
  Tournament_detail tournaments;
  TournamentDetail({this.tournaments});

  @override
  _TournamentDetailState createState() => _TournamentDetailState();
}

class _TournamentDetailState extends State<TournamentDetail> {
  var temp = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var dn = DateTime(temp.year, temp.month, temp.day, temp.hour, temp.minute);
    DateTime tempDate = DateFormat("yyyy-MM-dd HH:mm")
        .parse(widget.tournaments.data.dateTimezone);
    DateTime tempDate2 = DateFormat("yyyy-MM-dd HH:mm")
        .parse(widget.tournaments.data.paymentDeadlineTimezone);
    String payment_date =
        DateFormat("dd MMMM yyyy HH:mm").format(tempDate2).toString();

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
            'Tournament Detail',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 414.0,
                  height: 218.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${widget.tournaments.data.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  '${widget.tournaments.data.name}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  DateFormat("dd MMMM yyyy HH:mm").format(tempDate).toString(),
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: const Color(0xff858585),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(),
                      Column(
                        children: <Widget>[
                          Text(
                            'Book',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${widget.tournaments.data.attendance.waitingListCount}/${widget.tournaments.data.attendance.waitingLimit}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xff585858),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Container(),
                      Container(),
                      Container(),
                      Column(
                        children: <Widget>[
                          Text(
                            'Paid',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xff858585),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${widget.tournaments.data.attendance.reservesCount}/${widget.tournaments.data.attendance.reserveLimit}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xff585858),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Container(),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Handicap Limit',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 12,
                                color: const Color(0xff858585),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${widget.tournaments.data.handicapLimit}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xff585858),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Builder(
                  builder: (context) {
                    if (tempDate.compareTo(dn) <= 0) {
                      return InkWell(
                        onTap: () {
                          Dialogs().showLoadingDialog(context);
                          TournamentApi()
                              .tournamentLeaderboard(widget.tournaments.data.id)
                              .then((value) {
                            print(value);
                            context
                                .bloc<LeaderboardCubit>()
                                .getLeaderboard(value);
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TournamentLeaderBoard(),
                                  ));
                            });
                          });
                        },
                        child: Container(
                          width: size.width,
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/leaderboard_btn.png")),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 194.0,
                              child: Text(
                                'VIEW LEADERBOARD',
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
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                Builder(
                  builder: (context) {
                    if (tempDate2.compareTo(dn) > 0) {
                      return Container(
                        width: size.width,
                        height: 222.0,
                        margin: EdgeInsets.only(left: 20, right: 20),
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
                          margin: EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: 22,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 72.0,
                                child: Text(
                                  'Event Fee',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xff858585),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 180.0,
                                child: Text(
                                  '${widget.tournaments.data.feeStr}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 24,
                                    color: const Color(0xffb90b0c),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              SizedBox(
                                width: 170.0,
                                child: Text(
                                  'Includes administration fee',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    color: const Color(0xff858585),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: 276.0,
                                child: Text(
                                  'Pay before ${payment_date}',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xff858585),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Builder(
                                builder: (context) {
                                  if (context
                                          .bloc<BookingsCubit>()
                                          .detailbooking !=
                                      null) {
                                    return SizedBox(
                                      width: 204.0,
                                      child: Text(
                                        'Your payment is in progress',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff2698dd),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  } else {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            print("book slot tournament");
                                            BookingApi()
                                                .bookingTournament(
                                                    widget.tournaments.data.id)
                                                .then((value) {
                                              Fluttertoast.showToast(
                                                  msg: "${value}",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.grey,
                                                  textColor: Colors.white,
                                                  fontSize: 14.0);
                                            });
                                          },
                                          child: Container(
                                            width: 160.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: const Color(0xffffaf00),
                                            ),
                                            child: SizedBox(
                                              width: 108.0,
                                              child: Center(
                                                child: Text(
                                                  'BOOK SLOT',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Dialogs()
                                                .showLoadingDialog(context);
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 500), () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TournamentPay(
                                                      harga_tournament: widget
                                                          .tournaments
                                                          .data
                                                          .feeStr,
                                                      tournament_detail:
                                                          widget.tournaments,
                                                    ),
                                                  ));
                                            });
                                          },
                                          child: Container(
                                            width: 160.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: const Color(0xff3cd970),
                                            ),
                                            child: Center(
                                              child: SizedBox(
                                                width: 89.0,
                                                child: Text(
                                                  'PAY NOW',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: size.width,
                  height: 187,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
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
                    margin: EdgeInsets.only(top: 21, left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Any question?',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          'Contact our PIC (${widget.tournaments.data.contact.pic}) by clicking on the button below.',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            color: const Color(0xff858585),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        InkWell(
                          onTap: () {
                            print(widget.tournaments.data.contact.phoneNumber);
                            launch(
                                ('tel://${widget.tournaments.data.contact.phoneNumber}'));
                          },
                          child: Container(
                            width: size.width,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xff2698dd),
                            ),
                            child: Center(
                              child: Text(
                                'CONTACT OUR PIC',
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
                ),
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
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
                        child: TabBar(
                          indicatorColor: const Color(0xffb90b0c),
                          unselectedLabelColor: const Color(0xff858585),
                          tabs: [
                            Tab(
                              child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Center(
                                          child: Text(
                                        "Info",
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 13,
                                          color: const Color(0xffb90b0c),
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                    )),
                                  ]),
                            ),
                            Tab(
                              child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Center(
                                          child: Text(
                                        "About",
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 13,
                                          color: const Color(0xffb90b0c),
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                    )),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 219.0,
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
                        child: TabBarView(
                          children: <Widget>[
                            Builder(
                              builder: (context) {
                                return TournamentInfo();
                              },
                            ),
                            Builder(
                              builder: (context) {
                                return TournamentAbout(
                                    tournamentss: widget.tournaments);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
