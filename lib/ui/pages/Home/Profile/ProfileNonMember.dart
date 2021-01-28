import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/ui/widgets/txtformfield.dart';

class ProfileNonMember extends StatefulWidget {
  ProfileNonMember({Key key}) : super(key: key);

  @override
  _ProfileNonMemberState createState() => _ProfileNonMemberState();
}

class _ProfileNonMemberState extends State<ProfileNonMember> {
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
              'Become a HGC Member',
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
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nickname',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Birthplace',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Home Address',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 87.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Directorate',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Workplace Location',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Work Position',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Other Organization/Membership',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Start Playing Golf',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width,
                      height: 45.0,
                      margin: EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffb90b0c),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffbababa)),
                      ),
                      child: Center(
                        child: Text(
                          'BECOME HGC MEMBER',
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
                    SizedBox(
                      height: 45,
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
