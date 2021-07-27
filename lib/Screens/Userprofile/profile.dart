import 'package:attendance/sharedwidget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController roleText = TextEditingController();
  String dropdownValue = 'Employee';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin",
          style: GoogleFonts.poppins(
            color: Color(0xff4d3a58),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff4d3a58),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputFieldArea(
                    hint: "Full name",
                    obscure: false,
                    icon: Icons.person_outline,
                    controllerval: fullname,
                  ),
                  InputFieldArea(
                    hint: "User name",
                    obscure: false,
                    icon: Icons.account_circle,
                    controllerval: username,
                  ),
                  InputFieldArea(
                      hint: "Password",
                      obscure: true,
                      icon: Icons.lock_outline,
                      controllerval: password),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            print(fullname.text);
                            print(username.text);
                            print(password.text);
                            print(dropdownValue);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.06,
                            alignment: FractionalOffset.center,
                            decoration: new BoxDecoration(
                              color: Color(0xff4d3a58),
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(30.0)),
                            ),
                            child: new Text(
                              "Update",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
