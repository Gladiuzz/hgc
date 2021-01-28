import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  Invoice({Key key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
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
              'Invoice',
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
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: size.width,
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
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 75.0,
                                  height: 75.0,
                                  margin: EdgeInsets.only(left: 25, top: 25),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/tournament.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 35),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Pride of The Nation',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 18,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      Text(
                                        '15 November 2020',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.5,
                          ),
                          Divider(),
                          Container(
                            margin:
                                EdgeInsets.only(top: 17, left: 25, right: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Order ID',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '7',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 14,
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Buyer Name',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Aditya Hermawan',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Payment Type',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Bank Transfer BCA Virtual..',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        '# of ticket(s)',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Amount',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Rp. 10.000',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Transaction Time',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Saturday, 14-11-2020',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff858585),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Paid',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          )
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
    );
  }
}
