// import 'package:bcard/src/net/linksdata/icons_mapping.dart';
// import 'package:bcard/src/net/services/firestore_operations.dart';
// import 'package:bcard/src/pages/accounts/add_account.dart';
// import 'package:bcard/src/pages/auth/email_login_widget.dart';
// import 'package:bcard/src/pages/profile/profile_preview.dart';
// import 'package:bcard/src/utlis/enum/acount_pop_up.dart';
// import 'package:bcard/src/widgets/auth_widgets/my_text_button.dart';
// import 'package:bcard/src/widgets/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../widgets/customlistView.dart';


// import '../pages/profile/edit_profile.dart';
// import '../widgets/auth_widgets/my_text_field.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({Key? key}) : super(key: key);

  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<PropertyList> {
  var usersQuery = FirebaseFirestore.instance
      .collection('cases');

  String name = '';
  String comments = '';
  String id = '';
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child:  listViewBuilder(),
    );
  }

  Widget StaticView(IconData icon, var user) {
    return InkWell(
      onTap: () {
        // print(user);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => AddEditCase(
        //             addEditCase: CaseOpType.EditCase, record: user)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
        child: Padding(
            padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  LineIcons.user,
                                  color: Colors.black38,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['name'],
                                      style: GoogleFonts.raleway(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 05,
                                    ),
                                    Text(
                                      'CNIC: ' + user['id'],
                                      style: GoogleFonts.raleway(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Patient#: ' + user['comments'],
                                      style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget listViewBuilder() {
    // print(
    //     "check this :${FirebaseFirestore.instance.collection('patients').get()}");
    return FirestoreListViewCustom<Map<String, dynamic>>(
      query: usersQuery,
      pageSize: 10,
      // query: hospitalsQuery,
      physics: BouncingScrollPhysics(),
      errorBuilder: (context, error, stackTrace) {
        return Text('asfda' + error.toString(),
            style: GoogleFonts.poppins(color: Colors.black));
      },
      itemBuilder: (context, snapshot) {
        Map<String, dynamic> user = snapshot.data();
        print("asd" + snapshot.toString());
        return StaticView(LineIcons.medicalNotes, user);
      },
    );
  }

  // Widget SearchView() {
  //   return InkWell(
  //     onTap: () {},
  //     child: Container(
  //       decoration: BoxDecoration(
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.1),
  //               spreadRadius: 10,
  //               blurRadius: 7,
  //               offset: Offset(0, 3), // changes position of shadow
  //             ),
  //           ],
  //           borderRadius: BorderRadius.all(Radius.circular(08)),
  //           color: Colors.white),
  //       child: Padding(
  //           padding:
  //           const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               MyTextFieldSearch(
  //                 hintText: 'Enter CNIC or Patient#',
  //                 inputType: TextInputType.number,
  //                 controller: search,
  //                 onClear: (){
  //                   if(search!=null && search.text!=''){
  //                     search.clear();
  //                     usersQuery = FirebaseFirestore.instance
  //                         .collection('patients')
  //                         .where('hostpialname', isEqualTo: HOSPITAL_NAME)
  //                         .where('isDeleted', isEqualTo: false);
  //                     setState(() {
  //                     });
  //                   }
  //                 },
  //               ),
  //               Text(' CNIC should be without dashes.',),
  //               SizedBox(height:10),
  //               Row(children: [
  //                 Expanded(child:  Container(
  //                   height: 40,
  //                   child: MyTextButton(
  //                     radius: 8,
  //                     buttonName: 'Search CNIC',
  //                     onTap: () async {
  //                       FocusScope.of(context).unfocus();
  //                       if (search != null && search.text != '') {
  //                         usersQuery = FirebaseFirestore.instance
  //                             .collection('patients')
  //                             .where('hostpialname', isEqualTo: HOSPITAL_NAME)
  //                             .where('isDeleted', isEqualTo: false)
  //                             .where('cnic',
  //                             isGreaterThanOrEqualTo: search.text)
  //                             .where('cnic', isLessThan: search.text + 'z');
  //                       }
  //                     },
  //                     bgColor: kButtonColors,
  //                     textColor: kButtonTextColor,
  //                   ),
  //                 ),),
  //                 SizedBox(width: 10,),
  //                 Expanded(child:  Container(
  //                   height: 40,
  //                   child: MyTextButton(
  //                     radius: 8,
  //                     buttonName: 'Search Patient#',
  //                     onTap: () async {
  //                       FocusScope.of(context).unfocus();
  //                       if (search != null && search.text != '') {
  //                         usersQuery = FirebaseFirestore.instance
  //                             .collection('patients')
  //                             .where('hostpialname', isEqualTo: HOSPITAL_NAME)
  //                             .where('isDeleted', isEqualTo: false)
  //                             .where('id',
  //                             isGreaterThanOrEqualTo: search.text)
  //                             .where('id', isLessThan: search.text + 'z');
  //                       }
  //
  //                     },
  //                     bgColor: kButtonColors,
  //                     textColor: kButtonTextColor,
  //                   ),
  //                 ),),
  //
  //               ],)
  //             ],
  //           )),
  //     ),
  //   );
  // }
}
