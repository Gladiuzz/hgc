import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class txtsearchfield extends StatefulWidget {
  var height, hint, keyboard_type;

  txtsearchfield({this.height, this.hint, this.keyboard_type});

  @override
  _txtsearchfieldState createState() => _txtsearchfieldState();
}

class _txtsearchfieldState extends State<txtsearchfield> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color(0xffffffff),
        border: Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
      ),
      child: TextFormField(
        keyboardType: widget.keyboard_type,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.only(bottom: 15, left: 14),
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: const Color(0xff9a9a9a),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
