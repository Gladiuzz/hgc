import 'package:flutter/cupertino.dart';

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;
  Widget button, lewati;

  SlideTile({this.imagePath, this.title, this.desc, this.button, this.lewati});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: <Widget>[
          lewati,
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    imagePath,
                    width: 167,
                    height: 170,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: size.width * 0.90,
                    child: Text(desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                          color: const Color(0xffb40300),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
