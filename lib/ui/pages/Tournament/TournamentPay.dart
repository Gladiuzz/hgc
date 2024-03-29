import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/tournament_cubit.dart';
import 'package:hgc/model/bookings.dart';
import 'package:hgc/model/tournamentDetail.dart';
import 'package:hgc/service/BookingAPI.dart';
import 'package:hgc/service/TournamentAPI.dart';
import 'package:hgc/ui/pages/Tournament/TournamentDetail.dart';
import 'package:hgc/ui/widgets/Dialog/Dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TournamentPay extends StatefulWidget {
  String harga_tournament;
  Tournament_detail tournament_detail;

  TournamentPay({
    this.harga_tournament,
    this.tournament_detail,
  });

  @override
  _TournamentPayState createState() => _TournamentPayState();
}

class _TournamentPayState extends State<TournamentPay> {
  int selectedRadio = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  _launchURL(link_pembayaran) async {
    var url = '${link_pembayaran}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    BookingApi().showBookedTournament().then((value) {
      print("bookingan ${value}");
      context.bloc<BookingsCubit>().getActiveTournament(value);
    });

    TournamentApi()
        .showDetailTournament(widget.tournament_detail.data.id)
        .then((value) {
      context.bloc<TournamentCubit>().getDetailTournament(value);
      print(context.bloc<TournamentCubit>().detail_tournament.data.booking.id);

      var list = context.bloc<BookingsCubit>().book;

      List<Book> contains_tournament = list
          .where((element) => element.id
              .toString()
              .contains(widget.tournament_detail.data.id.toString()))
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TournamentDetail(
                tournaments: widget.tournament_detail,
              ),
            ));
      },
      child: Container(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffffffff),
              titleSpacing: 0.0,
              leading: IconButton(
                icon:
                    Icon(Icons.arrow_back_ios, color: const Color(0xffb90b0c)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TournamentDetail(
                          tournaments: widget.tournament_detail,
                        ),
                      ));
                },
              ),
              title: Text(
                'Payment',
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
                  children: <Widget>[
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0d000000),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Container(
                        width: size.width,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Text(
                              'Virtual Account',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Container(
                            //       child: Row(
                            //         children: <Widget>[
                            //           Radio(
                            //             value: 10,
                            //             groupValue: selectedRadio,
                            //             activeColor: Color(0xffed2025),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 print("Radio$val");
                            //                 setSelectedRadio(val);
                            //               });
                            //             },
                            //           ),
                            //           Container(
                            //             width: 60,
                            //             height: 31,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(1.0),
                            //               image: DecorationImage(
                            //                 image: const AssetImage(
                            //                     'assets/images/bca.png'),
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Text(
                            //             'BCA Virtual Account',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 14,
                            //               color: const Color(0xff292929),
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.keyboard_arrow_right_sharp,
                            //       size: 24,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15.5,
                            // ),
                            // SvgPicture.string(
                            //   '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //   allowDrawingOutsideViewBox: true,
                            // ),
                            // SizedBox(
                            //   height: 14.5,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Container(
                            //       child: Row(
                            //         children: <Widget>[
                            //           Radio(
                            //             value: 11,
                            //             groupValue: selectedRadio,
                            //             activeColor: Color(0xffed2025),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 print("Radio$val");
                            //                 setSelectedRadio(val);
                            //               });
                            //             },
                            //           ),
                            //           Container(
                            //             width: 60,
                            //             height: 31,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(1.0),
                            //               image: DecorationImage(
                            //                 image: const AssetImage(
                            //                     'assets/images/bca_klikpay.jpg'),
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Text(
                            //             'BCA KlikPay',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 14,
                            //               color: const Color(0xff292929),
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.keyboard_arrow_right_sharp,
                            //       size: 24,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15.5,
                            // ),
                            // SvgPicture.string(
                            //   '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //   allowDrawingOutsideViewBox: true,
                            // ),
                            // SizedBox(
                            //   height: 14.5,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 12,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/Bni.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'BNI Virtual Account',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Container(
                            //       child: Row(
                            //         children: <Widget>[
                            //           Radio(
                            //             value: 13,
                            //             groupValue: selectedRadio,
                            //             activeColor: Color(0xffed2025),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 print("Radio$val");
                            //                 setSelectedRadio(val);
                            //               });
                            //             },
                            //           ),
                            //           Container(
                            //             width: 60,
                            //             height: 31,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(1.0),
                            //               image: DecorationImage(
                            //                 image: const AssetImage(
                            //                     'assets/images/bri.png'),
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Text(
                            //             'BRI E-PAY',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 14,
                            //               color: const Color(0xff292929),
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.keyboard_arrow_right_sharp,
                            //       size: 24,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15.5,
                            // ),
                            // SvgPicture.string(
                            //   '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //   allowDrawingOutsideViewBox: true,
                            // ),
                            // SizedBox(
                            //   height: 14.5,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 14,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/cimb.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'CIMB Virtual Account',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 15,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/danamon_online_banking.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Danamon Online Banking',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 16,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/danamon.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Danamon Virtual Account',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Container(
                            //       child: Row(
                            //         children: <Widget>[
                            //           Radio(
                            //             value: 17,
                            //             groupValue: selectedRadio,
                            //             activeColor: Color(0xffed2025),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 print("Radio$val");
                            //                 setSelectedRadio(val);
                            //               });
                            //             },
                            //           ),
                            //           Container(
                            //             width: 60,
                            //             height: 31,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(1.0),
                            //               image: DecorationImage(
                            //                 image: const AssetImage(
                            //                     'assets/images/linkaja.png'),
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Text(
                            //             'LinkAja',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 14,
                            //               color: const Color(0xff292929),
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.keyboard_arrow_right_sharp,
                            //       size: 24,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15.5,
                            // ),
                            // SvgPicture.string(
                            //   '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //   allowDrawingOutsideViewBox: true,
                            // ),
                            // SizedBox(
                            //   height: 14.5,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 18,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/mandiri.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Mandiri Virtual Account',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 19,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/maybank.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Maybank Virtual Account',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Container(
                            //       child: Row(
                            //         children: <Widget>[
                            //           Radio(
                            //             value: 20,
                            //             groupValue: selectedRadio,
                            //             activeColor: Color(0xffed2025),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 print("Radio$val");
                            //                 setSelectedRadio(val);
                            //               });
                            //             },
                            //           ),
                            //           Container(
                            //             width: 60,
                            //             height: 31,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(1.0),
                            //               image: DecorationImage(
                            //                 image: const AssetImage(
                            //                     'assets/images/ovo.png'),
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Text(
                            //             'Ovo',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 14,
                            //               color: const Color(0xff292929),
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.keyboard_arrow_right_sharp,
                            //       size: 24,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15.5,
                            // ),
                            // SvgPicture.string(
                            //   '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //   allowDrawingOutsideViewBox: true,
                            // ),
                            // SizedBox(
                            //   height: 14.5,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 21,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/permata.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Permata ',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Container(
                            //       child: Row(
                            //         children: <Widget>[
                            //           Radio(
                            //             value: 22,
                            //             groupValue: selectedRadio,
                            //             activeColor: Color(0xffed2025),
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 print("Radio$val");
                            //                 setSelectedRadio(val);
                            //               });
                            //             },
                            //           ),
                            //           Container(
                            //             width: 60,
                            //             height: 31,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(1.0),
                            //               image: DecorationImage(
                            //                 image: const AssetImage(
                            //                     'assets/images/sakuku.png'),
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 10,
                            //           ),
                            //           Text(
                            //             'Sakuku',
                            //             style: TextStyle(
                            //               fontFamily: 'Roboto',
                            //               fontSize: 14,
                            //               color: const Color(0xff292929),
                            //             ),
                            //             textAlign: TextAlign.left,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.keyboard_arrow_right_sharp,
                            //       size: 24,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 15.5,
                            // ),
                            // SvgPicture.string(
                            //   '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //   allowDrawingOutsideViewBox: true,
                            // ),
                            // SizedBox(
                            //   height: 14.5,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 23,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/sinarmas.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Sinarmas Virtual Account',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 24,
                                        groupValue: selectedRadio,
                                        activeColor: Color(0xffed2025),
                                        onChanged: (val) {
                                          setState(() {
                                            print("Radio$val");
                                            setSelectedRadio(val);
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 60,
                                        height: 31,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/alfa_group.jpg'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Alfa Group',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: const Color(0xff292929),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 24,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.5,
                            ),
                            SvgPicture.string(
                              '<svg viewBox="6.0 230.5 414.5 1.0" ><path transform="translate(6.0, 230.5)" d="M 0 0 L 414.5 0" fill="none" stroke="#e5e5e5" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(
                              height: 14.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 12.5, left: 30, right: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Payment Total',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 14,
                                    color: const Color(0xff292929),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  widget.harga_tournament.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    color: const Color(0xffb90b0c),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                            // Adobe XD layer: 'Rectangle 1 copy 20' (shape)
                            GestureDetector(
                              onTap: () {
                                Dialogs().showLoadingDialog(context);
                                print(context
                                    .bloc<BookingsCubit>()
                                    .detailbooking
                                    .data);
                                TournamentApi()
                                    .payTournament(
                                        context
                                            .bloc<BookingsCubit>()
                                            .detailbooking
                                            .data
                                            .id,
                                        selectedRadio.toString())
                                    .then((value) {
                                  print(context
                                      .bloc<BookingsCubit>()
                                      .detailbooking
                                      .data
                                      .id);
                                  // print(value);
                                  print(selectedRadio.toString());
                                  if (value["message"] == null) {
                                    Navigator.pop(context);
                                    _launchURL(value['redirect_url']);
                                  } else {
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(
                                        msg: "Your booking already exists.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white,
                                        fontSize: 14.0);
                                  }
                                });
                                print('bayar');
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  color: const Color(0xffb90b0c),
                                ),
                                child: Center(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 40, right: 40),
                                    child: Text(
                                      'PAY NOW',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 16,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.16,
                                        fontWeight: FontWeight.w700,
                                        height: 1,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
