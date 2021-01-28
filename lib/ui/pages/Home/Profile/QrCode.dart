import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgc/cubit/user_cubit.dart';

class QrCode extends StatefulWidget {
  QrCode({Key key}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
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
            'QR Code',
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
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 148.0,
                      height: 148.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${(context.bloc<UserCubit>().state as UserLoaded).user.links.qrCode}'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Member ID',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    SizedBox(
                      width: 70.0,
                      child: Text(
                        'A ${(context.bloc<UserCubit>().state as UserLoaded).user.id}',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
