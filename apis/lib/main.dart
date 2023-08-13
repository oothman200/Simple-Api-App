import 'dart:collection';

import 'package:apis/models/user.dart';
import 'package:apis/screens/Gallary/gallary_scr.dart';
import 'package:apis/screens/add-post/add_post_scr.dart';
import 'package:apis/screens/article/article_scr.dart';
import 'package:apis/screens/auth/splash/splash_scr.dart';
import 'package:apis/screens/imageDetails/imageDetails_scr.dart';
import 'package:apis/screens/post-details/postdetails_scr.dart';
import 'package:apis/screens/post/posts_scr.dart';
import 'package:apis/screens/home/main-home_scr.dart';
import 'package:apis/screens/user-details/userdetails_scr.dart';
import 'package:apis/screens/users/user_scr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        PostsScreen.routeName:(context) => PostsScreen(),
        MainHomeScreen.routeName:(context) => MainHomeScreen(),
        GallaryScreen.routeName:(context) => GallaryScreen(),
        PostDetailScreen.routeName:(context) => PostDetailScreen(),
        ImageDetailsScreen.routeName :(context) => ImageDetailsScreen(),
        AddPostScreen.routeName :(context) => AddPostScreen(),
        ArticleScreen.routeName :(context) => ArticleScreen(),
        UserScreen.routeName :(context) => UserScreen(),
        UserDetailsScreen.routeName:(context) => UserDetailsScreen(),
      },
    );
  }
}
