import 'package:attendance/sharedwidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageWifi extends StatefulWidget {
  const ManageWifi({Key? key}) : super(key: key);

  @override
  _ManageWifiState createState() => _ManageWifiState();
}

class _ManageWifiState extends State<ManageWifi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Wifi",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Text("Wifi Manage"),
            ),
          ),
        ),
      ),
    );
  }
}
