import 'package:apis/controller/apiConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../models/post.dart';

class PostDetailScreen extends StatefulWidget {
  static String routeName = '/PostDetailScreen';
  const PostDetailScreen({this.id});
  final int? id;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late Post myPost;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  getPost() async {
    myPost = await ApiConfig.getPost(widget.id.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
        centerTitle: true,
      ),
      body: isLoading
          ? SpinKitRing(
              color: Colors.red,
              size: 50.0,
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'user id:'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 20),
                      Text(myPost.userId.toString()),
                    ],
                  ),

                  SizedBox(height: 20),
                  // title
                  Row(
                    children: [
                      Text(
                        'Title:'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          myPost.title ?? '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // text title
                  Row(
                    children: [
                      Text(
                        'body:'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Text(
                        myPost.body.toString(),
                        style: TextStyle(fontSize: 16),
                      ),)
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
