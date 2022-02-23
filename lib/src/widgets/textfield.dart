import 'package:flutter/material.dart';
class TextFieldApp extends StatefulWidget {
  final String hint;
  final bool isPasswordl;
  final Color colorwhite;
  final int minline;
  final double radius;
  final TextEditingController controller;
  const TextFieldApp({Key? key,required this.hint,this.isPasswordl=false,required this.controller,this.colorwhite=Colors.white,this.minline=1,this.radius=35}) : super(key: key);

  @override
  _TextFieldAppState createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  int maxline=10;
  @override
  void initState() {
    if(widget.isPasswordl){
      maxline = 1;
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.minline>1?150:45,
      child: TextField(
        maxLines: maxline,
        minLines:  widget.minline,
        style: TextStyle(
          color:widget.colorwhite
        ),
        controller: widget.controller,
        obscureText: widget.isPasswordl,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            contentPadding: EdgeInsets.only(left: 30,right: 20,top: widget.minline>1?35:0),
            filled: true,
            hintStyle: TextStyle(color: widget.colorwhite),
            hintText: widget.hint,
            fillColor: Colors.white70.withOpacity(.3)),
      ),
    );
  }
}
