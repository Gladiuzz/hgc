import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({Key key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
            'Privacy Policy',
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
            height: size.height,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 28,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 373.0,
                    child: Text(
                      'Halo Golf Club built the Halo Golf Club app as a Free app. This SERVICE is provided by Halo Golf Club at no cost and is intended for use as is.This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service. If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Halo Golf Club unless otherwise defined in this Privacy Policy.',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
