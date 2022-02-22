import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memorabledubai/src/pages/auth/sign_in.dart';

import 'dashboard_pages/home.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {



  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("YES"),
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SignIn()),
                (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Welcome Ali Hamza',
          style: GoogleFonts.raleway(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        leadingWidth: 0,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(right: 15.0, top: 05),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 3),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: () async {
                    showAlertDialog(context);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 05,
                      ),
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: HomePage(),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                selectedItemColor: Colors.black,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(LineIcons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(LineIcons.users), label: 'Clients')
                ],
              ),
            )
        )
    );
  }
}