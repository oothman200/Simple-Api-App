
import 'package:apis/controller/apiConfig.dart';
import 'package:apis/screens/add-post/add_post_scr.dart';
import 'package:apis/screens/post-details/postdetails_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../models/post.dart';

class PostsScreen extends StatefulWidget {
  static String routeName = '/HomeScreen';
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  //
  List<Post> posts = [];
  bool isLoading = true;
  //
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await ApiConfig.getPosts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPostScreen.routeName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: isLoading
          ? //SpinKitRotatingCircle : شكل دائرة
          SpinKitRing(
              color: Colors.red,
              size: 50.0,
            )
          : ListView.separated(
              padding: EdgeInsets.all(15),
              itemCount: posts.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   PostDetailScreen.routeName,
                  //   arguments: {'id ': posts[index].id.toString()},
                  // );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PostDetailScreen(id: posts[index].id!),
                    ),
                  );
                },
                child: ListTile(
                  tileColor: Colors.green.shade50,
                  leading: Text(posts[index].userId.toString()),
                  title: Text(
                    posts[index].title ?? '',
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    posts[index].body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
    );
  }
}
