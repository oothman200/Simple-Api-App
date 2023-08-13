import 'package:apis/screens/Gallary/gallary_scr.dart';
import 'package:apis/screens/article/article_scr.dart';
import 'package:apis/screens/post/posts_scr.dart';
import 'package:apis/screens/users/user_scr.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  static String routeName = '/MainHomeScreen';
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  //
  int selectedIndex = 0;
  //

  var myScreens = [
    PostsScreen(),
    GallaryScreen(),
    ArticleScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            label: 'Images',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.),
          //   label: 'Images',
          // ),
        ],
      ),
    );
  }
}
