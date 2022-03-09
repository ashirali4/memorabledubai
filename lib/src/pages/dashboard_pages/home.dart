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
  Widget WidgetBox(String text,String Iconname,Function function,[bool isPng=false,double height=40,double distance=15]) {
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
            Container(
              child:!isPng?SvgPicture.asset('assets/dashboard/'+Iconname+'.svg',color: Colors.black,height: 50,):Image.asset('assets/dashboard/'+Iconname+'.png',height: height)
            ),
            SizedBox(
              height: distance,
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.raleway(fontSize: 18),
                textAlign: TextAlign.center,
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
              Expanded(child: WidgetBox('SEARCH PORTAL PF','building',(){})),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('SEARCH PORTAL DB','build2',(){})),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: WidgetBox('SEARCH PORTAL BT ','house',(){})),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('MEMORABLE','black_icon',(){},true,80,0)),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: WidgetBox('OUR PARTNER EMAAR  ','emaar',(){},true,60,5)),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('DUBAI PROPERTIES','DP',(){},true,60,5)),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: WidgetBox('OUR PARTNER DAMAC','Damac',(){},true,60,5)),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('OUR PARTNER NAKHEEL','Nakheel',(){},true,60,5)),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: WidgetBox('OUR PARTNER SOBHA','Sobha',(){},true,60,5)),
              SizedBox(width: 15),
              Expanded(child: WidgetBox('THE POWER OF RESPECT','black_icon',(){},true,60,5)),
            ],
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
