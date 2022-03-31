import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
class PhotoViewCustom extends StatefulWidget {
  var data;
  int fPage;
  PhotoViewCustom({Key? key,required this.data,required this.fPage}) : super(key: key);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoViewCustom> {
  int firstPage = 0;
  PageController? _pageController;
  @override
  void initState() {
    firstPage=widget.fPage;
    _pageController = PageController(initialPage: widget.fPage);
    // TODO: implement initState
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      firstPage = index;
    });
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
      body: Stack(children: [
        PhotoViewGallery.builder(
          onPageChanged: onPageChanged,
          pageController: _pageController,
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.data['images'][index].toString()),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: widget.data['image_comments'][index].toString(),
              ),
            );
          },
          itemCount: widget.data['images'].length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : 2,
              ),
            ),
          ),

        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.data['image_comments'][firstPage].toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              decoration: null,
            ),
          ),
        )
      ],)
    );
  }
}
