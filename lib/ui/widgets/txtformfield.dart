import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class txtFormField extends StatefulWidget {
  var height, hint, keyboard_type, controller, enabled;

  txtFormField(
      {this.height,
      this.hint,
      this.keyboard_type,
      this.controller,
      this.enabled});

  @override
  _txtFormFieldState createState() => _txtFormFieldState();
}

class _txtFormFieldState extends State<txtFormField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color(0xffffffff),
        border: Border.all(width: 1.0, color: const Color(0xffbababa)),
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: widget.controller,
        keyboardType: widget.keyboard_type,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5, left: 14),
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
