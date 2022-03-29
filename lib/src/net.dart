import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nanoid/nanoid.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference _mainCollectionHospitals =
_firestore.collection('cases');

class FirebaseDB {


  static Future<void> addcase({
    required String name,
    required String comments,
    required List<String> iamges
  }) async {
    var id = customAlphabet('H1234567890', 10);
    DocumentReference documentReferencer = _mainCollectionHospitals.doc(id);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "comments": comments,
      "images" : iamges
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Case Added"))
        .catchError((e) => print(e));
  }


  // static Future<dynamic> getHospitalName() async {
  //   String value='';
  //   var a = await _mainCollection.doc(FirebaseAuth.instance.currentUser!.email);
  //   await a.get().then((valuee) => {
  //     value=valuee['name']
  //   });
  //   return value;
  // }


  // static Future<dynamic> searchCase(String id,String type) async {
  //   bool error=true;
  //   var data;
  //   try{
  //     var a = await _mainCollectionpp.where(type,isEqualTo: id)  .where('isDeleted', isEqualTo: false).get();
  //     if(a.docs[0]!=null){
  //       data=a.docs[0];
  //       error=false;
  //     }
  //   }catch (e){
  //     error=true;
  //   }
  //   return {
  //     'error' : error,
  //     'data' : data
  //   };
  // }
}
