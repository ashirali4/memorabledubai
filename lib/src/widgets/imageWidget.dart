import 'dart:io';

import 'package:flutter/material.dart';
import 'package:memorabledubai/src/widgets/textfield.dart';

class MyImageWidget extends StatelessWidget {
  final int index;
  final File file;
  final Function onUpdate;
  final BuildContext context;
  final List<String> comments;
  final Function onDelete;
  MyImageWidget(
      {Key? key,
      required this.index,
      required this.file,
      required this.onUpdate,
      required this.comments,
      required this.onDelete,
      required this.context})
      : super(key: key);

  TextEditingController _commentValue = TextEditingController();



  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextFieldApp(
              radius: 5,
              colorwhite: Colors.black,
              hint: 'Additional Comments',
              minline: 5,
              controller: _commentValue,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Add Comments'),
                onPressed: () {
                  this.onUpdate(this.index,_commentValue.text);
                  _commentValue.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _commentValue.text = comments[index].toString();
    return Stack(
      children: [

        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.6),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(7.0))),
          child: InkWell(
            onTap: () {
              _displayDialog(context);
            },
            child: Center(
              child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white),
                  child: Center(child: Icon(Icons.add_comment_outlined))),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 50,
          child: InkWell(
            onTap: (){
              onDelete(index);
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.red),
                child: Center(child: Icon(Icons.delete,color: Colors.white,))),
          ),
        ),
      ],
    );
  }
}
