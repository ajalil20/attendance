import 'package:attendance/sharedwidget/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends StatefulWidget {
  late String udname;
  late String udpassword;
  late String udrole;
  late String uduser_name;
  UserDetails(
      {required this.udname,
      required this.uduser_name,
      required this.udpassword,
      required this.udrole});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController roleText = TextEditingController();
  String dropdownValue = 'Employee';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullname.text = widget.udname;
    username.text = widget.uduser_name;
    password.text = widget.udpassword;
    roleText.text = widget.udrole;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
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
                  Text(
                    "Update User",
                    style: GoogleFonts.poppins(
                      color: Color(0xff4d3a58),
                      // fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.06,
                              alignment: FractionalOffset.center,
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff4d3a58),
                                ),
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(30.0)),
                              ),
                              child: new Text(
                                "Delete",
                                style: new TextStyle(
                                  color: Color(0xff4d3a58),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          )
                        ],
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
