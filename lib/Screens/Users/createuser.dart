import 'package:attendance/sharedwidget/drawer.dart';
import 'package:attendance/sharedwidget/inputfield.dart';
import 'package:attendance/sharedwidget/toastmessage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance/Screens/Home/home.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController roleText = TextEditingController();
  String dropdownValue = 'Employee';
  CreateUserfunc() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://attendancesys.web-designpakistan.com/signup-api'));
    request.body = json.encode({
      "name": fullname.text,
      "user_name": username.text,
      "password": password.text,
      "role": roleText.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("Success");
      showToastMessage("User Created");

      Navigator.pop(context);
    } else {
      showToastMessage("Please try again");

      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create User",
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
      drawer: AppDrawer(name: "name", usname: "usname", u2id: 1),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      focusColor: Colors.white,
                      // elevation: 5,
                      value: dropdownValue,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor: Color(0xff4d3a58),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Admin', 'Employee']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Select User ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
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
                            CreateUserfunc();
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
                              "Create User",
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
