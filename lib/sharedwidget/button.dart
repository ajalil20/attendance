import 'package:flutter/material.dart';

class Custombutton extends StatefulWidget {
  String buttontext = '';
  Custombutton({required this.buttontext});

  @override
  _CustombuttonState createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: MediaQuery.of(context).size.width * 3,
      height: MediaQuery.of(context).size.height * 0.06,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: Color(0xff4d3a58),
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: new Text(
        widget.buttontext,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}
