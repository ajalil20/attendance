import 'package:attendance/Screens/Home/home.dart';
import 'package:attendance/Screens/Manage%20Wifi/managewifi.dart';
import 'package:attendance/Screens/Userprofile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Home(),
          icon: Icon(Icons.home, color: Color(0xff4d3a58)),
          title: Text(
            "Home",
            style: GoogleFonts.poppins(
              color: Color(0xff4d3a58),
            ),
          ),
        ),
        TabNavigationItem(
          page: Home(),
          icon: Icon(Icons.people, color: Color(0xff4d3a58)),
          title: Text(
            "Users",
            style: GoogleFonts.poppins(
              color: Color(0xff4d3a58),
            ),
          ),
        ),
        TabNavigationItem(
          page: ManageWifi(),
          icon: Icon(Icons.wifi, color: Color(0xff4d3a58)),
          title: Text(
            "Wifi",
            style: GoogleFonts.poppins(
              color: Color(0xff4d3a58),
            ),
          ),
        ),
        TabNavigationItem(
          page: UserProfile(),
          icon: Icon(Icons.person, color: Color(0xff4d3a58)),
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(
              color: Color(0xff4d3a58),
            ),
          ),
        ),
      ];
}
