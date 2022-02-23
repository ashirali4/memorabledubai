
import 'dart:io';

import 'package:flutter/material.dart';
Widget myImageWidget(int index,File file){
  return InkWell(
    key: ValueKey(index),
    onTap: (){
    },
    child: Container(
      decoration:  BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: FileImage(
                file
            ),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.6),
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.all(
              Radius.circular(7.0))),
    ),
  );
}
