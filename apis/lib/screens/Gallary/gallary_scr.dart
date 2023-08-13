import 'package:apis/controller/apiConfig.dart';
import 'package:apis/models/GallaryImage.dart';
import 'package:apis/screens/imageDetails/imageDetails_scr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GallaryScreen extends StatefulWidget {
  static String routeName = '/GallaryScreen';
  const GallaryScreen({Key? key}) : super(key: key);

  @override
  State<GallaryScreen> createState() => _GallaryScreenState();
}

class _GallaryScreenState extends State<GallaryScreen> {
  //
  List<GallaryImage> images = [];
  bool isLoading = true;
  //

  @override
  void initState() {
    super.initState();
    getImages();
  }

  getImages() async {
    images = await ApiConfig.getGImages();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallary'),
        centerTitle: true,
      ),
      body: isLoading
          ? SpinKitRing(color: Colors.red, size: 50.0)
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                print(images[index].url);
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageDetailsScreen(imageId: images[index].id!),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '${images[index].url!}.png',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              },
            ),
    );
  }
}
