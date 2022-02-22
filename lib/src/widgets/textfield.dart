import 'package:flutter/material.dart';
class TextFieldApp extends StatefulWidget {
  final String hint;
  final bool isPasswordl;
  final TextEditingController controller;
  const TextFieldApp({Key? key,required this.hint,this.isPasswordl=false,required this.controller}) : super(key: key);

  @override
  _TextFieldAppState createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        style: TextStyle(
          color: Colors.white
        ),
        controller: widget.controller,
        obscureText: widget.isPasswordl,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            contentPadding: EdgeInsets.only(left: 30,right: 20,),
            filled: true,
            hintStyle: TextStyle(color: Colors.white),
            hintText: widget.hint,
            fillColor: Colors.white70.withOpacity(.3)),
      ),
    );
  }
}
