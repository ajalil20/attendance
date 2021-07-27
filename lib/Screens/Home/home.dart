import 'package:attendance/Screens/Charts/dailyattendance.dart';
import 'package:attendance/sharedwidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
            color: Color(0xff4d3a58),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff4d3a58)),
      ),
      drawer: AppDrawer(name: "name", usname: "usname", u2id: 1),
      body: SingleChildScrollView(
        child: Column(
          children: [TodayAttendance()],
        ),
      ),
    );
  }
}
