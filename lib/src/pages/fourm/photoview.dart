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
    _pageController = PageController(initialPage: widget.fPage);

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
      body: PhotoViewGallery.builder(
        pageController: _pageController,
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.data['images'][index].toString()),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(tag: index.toString()),
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
    );
  }
}
