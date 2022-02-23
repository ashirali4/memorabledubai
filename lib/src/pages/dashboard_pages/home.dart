import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memorabledubai/src/pages/auth/sign_in.dart';
import 'package:memorabledubai/src/pages/fourm/add_case.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget WidgetBox(String text,String Iconname,Function function) {
    return InkWell(
      onTap: (){
        function();
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.only(
            left: 15, right: 15, top: 30, bottom: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(08)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/dashboard/'+Iconname+'.svg',color: Colors.black,height: 50,),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.raleway(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(child: WidgetBox('Our Portal 01','building',(){})),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('Our Portal 02','build2',(){})),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: WidgetBox('Our Portal 03','house',(){})),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('Our Portal 04','real-estate',(){})),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: WidgetBox('Website','globe',(){})),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('Add Client','paper',(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddFormSecond()));
              })),
            ],
          )
        ],
      ),
    );
  }
}
