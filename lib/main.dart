import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memorabledubai/src/pages/auth/sign_in.dart';
import 'package:memorabledubai/src/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorable Dubai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}
