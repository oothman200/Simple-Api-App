import 'package:apis/controller/apiConfig.dart';
import 'package:apis/network/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../models/GallaryImage.dart';

class ImageDetailsScreen extends StatefulWidget {
  static String routeName = '/ImageDetailsScreen';
  const ImageDetailsScreen({Key? key, this.imageId}) : super(key: key);
  final int? imageId;

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  late GallaryImage gallaryImage;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getImage();
  }

  getImage() async {
    gallaryImage = await ApiConfig.getImageDetails(widget.imageId!.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
        centerTitle: true,
      ),
      body: isLoading? 
      SpinKitRing(
              color: Colors.red,
              size: 50.0,
            )
            : Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            gallaryImage.title ?? '-',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          //
          Text(
            'title:'.toUpperCase(),
            style: TextStyle(fontSize: 16),
          ),

           CachedNetworkImage(
                    imageUrl: gallaryImage.url ?? '',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
        ]),
      ),
    );
  }
}
