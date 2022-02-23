import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memorabledubai/src/widgets/textfield.dart';

import '../../net.dart';
import '../../widgets/button.dart';
import '../../widgets/imageWidget.dart';

class AddFormSecond extends StatefulWidget {
  AddFormSecond({Key? key}) : super(key: key);

  @override
  _AddFormSecondState createState() => _AddFormSecondState();
}

class _AddFormSecondState extends State<AddFormSecond> {
  List<File> _image = [];
  final picker = ImagePicker();
  TextEditingController name  = TextEditingController();
  TextEditingController comments  = TextEditingController(text: '');

  final ImagePicker _picker = ImagePicker();


  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        _image.add(File(photo.path));
      });
    } else {
      print('No image selected');
    }
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);


    if (image != null) {
      setState(() {
        _image.add(File(image.path));
      });
    } else {
      print('No image selected');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  double scrollSpeedVariable = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Add Client Case',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [],
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            children: [
              SizedBox(height: 50,),
              SvgPicture.asset('assets/dashboard/add.svg',height: 150,),
              SizedBox(height: 50,),
              ChooseImages(),
              TextFieldApp(
                radius: 10,
                colorwhite: Colors.black,
                hint: 'Client Name',
                controller: name,
              ),
              SizedBox(height: 10,),
              TextFieldApp(
                radius: 10,
                colorwhite: Colors.black,
                hint: 'Additional Comments',
                minline: 10,
                controller: comments,
              ),
              SizedBox(height: 40,),
              Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: GradientButton(buttonTEXT: 'Add Client Case', function: (){
                      FocusScope.of(context).unfocus();
                      if(name.text!=null && name.text!='' ){
                        FirebaseDB.addcase(name: name.text, comments: comments.text);
                      }else{
                        EasyLoading.showToast('Please enter Email & Password',toastPosition: EasyLoadingToastPosition.bottom);
                      }
                    },radius: 10,),
                  ))
            ],
          ),
        ),
      ),

    );
  }

  Widget AddImage(int index) {
    return InkWell(
      key: ValueKey(index),
      onTap: () {
        _showPicker();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 20,
            ),
            Text(
              "Add Images",style: TextStyle(
                fontSize: 12
            ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
      ),
    );
  }

  Widget ChooseImages(){
    return Container(
        child: GridView.count(
          padding: EdgeInsets.only(bottom: 20),
          crossAxisCount: 5,
          shrinkWrap: true,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: (150.0 / 200.0),
          children: List.generate(_image.length+1, (index) {
            if(index==0){
              return AddImage(0);
            }else{
              print(index);
              return myImageWidget(
                  index-1,
                  _image[index-1]
              );
            }
          }
          ),


        ));
  }

}
