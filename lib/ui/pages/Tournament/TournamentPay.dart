import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TournamentPay extends StatefulWidget {
  TournamentPay({Key key}) : super(key: key);

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/bca.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'BCA Virtual Account',
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
                                    Container(
                                      width: 60,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/bca_klikpay.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'BCA KlikPay',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/bri.png'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'BRI E-PAY',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/linkaja.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'LinkAja',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/ovo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Ovo',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 31,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/sakuku.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Sakuku',
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
                                'Rp. 1.019.000',
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
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              color: const Color(0xffb90b0c),
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(left: 40, right: 40),
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
