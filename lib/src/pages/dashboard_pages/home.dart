import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:memorabledubai/src/pages/auth/sign_in.dart';
import 'package:memorabledubai/src/pages/fourm/add_case.dart';

import '../../widgets/button.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}

class HomePage extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(
          hideUrlBar: false, toolbarTopBackgroundColor: Colors.white),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  Widget WidgetBox(String text, String Iconname, String function,
      [bool isPng = false, double height = 40, double distance = 15]) {
    return InkWell(
      onTap: () {
        widget.browser.openUrlRequest(
            urlRequest: URLRequest(url: Uri.parse(function)), options: options);
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 15),
        margin: EdgeInsets.only(top: 05, bottom: 05, left: 05, right: 05),
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
                child: !isPng
                    ? SvgPicture.asset(
                        'assets/dashboard/' + Iconname + '.svg',
                        color: Colors.black,
                        height: 50,
                      )
                    : Image.asset('assets/dashboard/' + Iconname + '.png',
                        height: height)),
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
      color: Colors.white,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20),
              child: Container(
                child: GradientButton(
                  buttonTEXT: 'Add Client Case',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddFormSecond()),
                    );
                  },
                  radius: 10,
                ),
              )),
          Row(
            children: [
              Expanded(
                  child: WidgetBox('SEARCH PORTAL PF', 'building',
                      'https://www.propertyfinder.ae/')),
              SizedBox(width: 15),
              Expanded(
                  child: WidgetBox('SEARCH PORTAL DB', 'build2',
                      'https://www.propertyfinder.ae/')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: WidgetBox(
                      'SEARCH PORTAL BT ', 'house', 'https://www.bayut.com/')),
              SizedBox(width: 15),
              Expanded(
                  child: WidgetBox('MEMORABLE', 'black_icon',
                      'https://www.memorabledubai.com/', true, 80, 0)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: WidgetBox('OUR PARTNER EMAAR  ', 'emaar',
                      'https://properties.emaar.com/', true, 60, 5)),
              SizedBox(width: 15),
              Expanded(
                  child: WidgetBox('DUBAI PROPERTIES', 'DP',
                      'https://www.dp.ae/', true, 60, 5)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: WidgetBox('OUR PARTNER DAMAC', 'Damac',
                      'https://www.damacproperties.com/', true, 60, 5)),
              SizedBox(width: 15),
              Expanded(
                  child: WidgetBox('OUR PARTNER NAKHEEL', 'Nakheel',
                      'https://www.nakheel.com/', true, 60, 5)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: WidgetBox('OUR PARTNER SOBHA', 'Sobha',
                      'https://www.sobha.com/', true, 60, 5)),
              SizedBox(width: 15),
              Expanded(
                  child: WidgetBox('THE POWER OF RESPECT', 'handshake', '')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
