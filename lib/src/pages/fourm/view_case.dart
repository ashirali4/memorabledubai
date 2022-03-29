import 'package:flutter/material.dart';
import 'package:memorabledubai/src/pages/fourm/photoview.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ViewCase extends StatefulWidget {
  var data;
  ViewCase({Key? key, required this.data}) : super(key: key);

  @override
  _ViewCaseState createState() => _ViewCaseState();
}

class _ViewCaseState extends State<ViewCase> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'View Case',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.data['name'],
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Comments',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.data['comments'],
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Gallery',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                padding: EdgeInsets.all(10.0),
                children: List.generate(
                  widget.data['images'].length,
                  (index) => ContainerViewBox(widget.data['images'][index],widget.data,index),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget ContainerViewBox(String url,var data,int index) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PhotoViewCustom(
                    data: data,fPage : index)));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(08)),
            color: Colors.white),
        height: 150,
        width: 150,
        child: Image.network(url),
      ),
    );
  }
}
