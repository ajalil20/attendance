import 'package:attendance/Screens/Bottomnav/tabspage.dart';
import 'package:attendance/Screens/SignIn/SignUp/signup.dart';
import 'package:attendance/sharedwidget/button.dart';
import 'package:attendance/sharedwidget/inputfield.dart';
import 'package:attendance/sharedwidget/toastmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  SignInfunc() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://attendancesys.web-designpakistan.com/signin-api'));
    request.body =
        json.encode({"user_name": username.text, "password": password.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      // if (success == true) {
      showToastMessage("Success");
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => TabsPage()));
      // }
    } else {
      showToastMessage("Please try again");

      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to",
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      // fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Attendance Portal",
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "Please login to continue",
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      // fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  InputFieldArea(
                      hint: "Username",
                      obscure: false,
                      icon: Icons.person_outline,
                      controllerval: username),
                  InputFieldArea(
                    hint: "Password",
                    obscure: true,
                    icon: Icons.lock_outline,
                    controllerval: password,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      SignInfunc();
                                    },
                                    child: Custombutton(
                                      buttontext: "Sign In",
                                    )),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Forgot Password?",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff4d3a58),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              "OR",
                              style: GoogleFonts.poppins(
                                color: Color(0xff4d3a58),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Custombutton(
                                  buttontext: "Sign Up",
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
