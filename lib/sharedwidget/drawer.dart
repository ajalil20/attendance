import 'package:attendance/Screens/Manage%20Wifi/managewifi.dart';
import 'package:attendance/Screens/Userprofile/profile.dart';
import 'package:attendance/Screens/Users/createuser.dart';
import 'package:attendance/Screens/Users/showusers.dart';
import 'package:attendance/Screens/SignIn/SignUp/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  String name;
  String usname;
  AppDrawer({required this.name, required this.usname, required int u2id});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            color: Color(0xff4d3a58),
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '@' + usname,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    // Manage Users
                    //'Create Users
                    ListTile(
                      title: Text(
                        'Create Users',
                        style: GoogleFonts.poppins(
                          color: Color(0xff4d3a58),
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CreateUser();
                            },
                          ),
                        );
                      },
                    ),

                    // Show Users
                    ListTile(
                      title: Text(
                        'Show Users',
                        style: GoogleFonts.poppins(
                          color: Color(0xff4d3a58),
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ShowUser();
                            },
                          ),
                        );
                      },
                    ),

                    // Manage Wifi
                    ListTile(
                      title: Text(
                        'Manage Wifi',
                        style: GoogleFonts.poppins(
                          color: Color(0xff4d3a58),
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ManageWifi();
                            },
                          ),
                        );
                      },
                    ),

                    // Manage Profile
                    ListTile(
                      title: Text(
                        'Manage Profile',
                        style: GoogleFonts.poppins(
                          color: Color(0xff4d3a58),
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UserProfile();
                            },
                          ),
                        );
                      },
                    ),

//                     //Create User
//                     currentusertype == "User A"
//                         ? ListTile(
//                             title: Text('Create User'),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) {
//                                     return createUser();
//                                   },
//                                 ),
//                               );
//                             },
//                           )
//                         : Container(),

// //Create Event

//                     currentusertype == "User A"
//                         ? ListTile(
//                             title: Text('Create Schedule'),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => AddEvents()));
//                             },
//                           )
//                         : Container(),

// //Create Questions

//                     currentusertype == "User A"
//                         ? ListTile(
//                             title: Text('Create Question'),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => AddAssignment()));
//                             },
//                           )
//                         : Container(),

// //Show all users
//                     currentusertype == "User A"
//                         ? ListTile(
//                             title: Text('Show Users  '),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => showUsers()));
//                             },
//                           )
//                         : Container(),

// //Show all schedules
//                     ListTile(
//                       title: Text('Show Schedules  '),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => showSchedules(
//                                       uuserid: u2id,
//                                     )));
//                       },
//                     ),

// //Show all questions
//                     ListTile(
//                       title: Text('Show Questions  '),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => showQuestions()));
//                       },
//                     ),
// // new addAssignment
                  ],
                ),
                // currentusertype == "User A"
                //     ? SizedBox(
                //         height: MediaQuery.of(context).size.height * 0.03,
                //       )
                //     :
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: FractionalOffset.center,
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: Color(0xff4d3a58),
                        ),
                        color: Colors.white,
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(30.0)),
                      ),
                      child: new Text(
                        "Log Out",
                        style: new TextStyle(
                          color: Color(0xff4d3a58),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Category
        ],
      ),
    );
  }
}
