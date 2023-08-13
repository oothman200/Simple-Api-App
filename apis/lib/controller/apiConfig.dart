

import 'package:apis/models/GallaryImage.dart';
import 'package:apis/models/post.dart';
import 'package:apis/models/user.dart';

import 'package:dio/dio.dart';

import '../network/api_url.dart';

 class ApiConfig {
  // get-posts
  static getPosts() async {
    var response = await Dio().get(Apis.postUrl);
    if(response.statusCode==200){
      // deal with data
      List<Post> postList = List.from(
        (response.data).map((e) => Post.fromJson(e)),

      );
      return postList;
    } else{
      // show toast msg
    }
    // print(response.statusCode);
    // print(response);
  }

  // get-post
  static getPost(String postId) async {
    var response = await Dio().get(Apis.postUrl + postId);
    if(response.statusCode==200){
      // deal with data
      Post post = Post.fromJson(response.data);
      return post;
    } else{
      // show toast msg
    }
  }

  // get-Images
  static getGImages() async {
    var response = await Dio().get(Apis.gImages);
    if(response.statusCode==200){
      // deal with data
      List<GallaryImage> imagesList = List.from(
        (response.data).map((e) => GallaryImage.fromJson(e)),

      );
      return imagesList;
    } else{
      // show toast msg
    }
  }

  // get-image
  static getImageDetails(String imageId) async {
    var response = await Dio().get(Apis.gImages + imageId);
    if(response.statusCode==200){
      // deal with data
      GallaryImage img = GallaryImage.fromJson(response.data);
      return img;
    } else{
      // show toast msg
    }
  }

  // add post
  static addPost(Map<String,dynamic> body) async {
    var response = await Dio().post(Apis.postUrl);
    if(response.statusCode==200 || response.statusCode==201){
      //
      print(response.data);
      //
      // deal with data
    } else{
      // show toast msg
    }
  }

  // get-users
  static getUsers() async {
    var response = await Dio().get(Apis.userUrl);
    if(response.statusCode==200){
      // deal with data
      List<Users> userList = List.from(
        (response.data).map((e) => Users.fromJson(e)),

      );
      return userList;
    } else{
      // show toast msg
    }
    // print(response.statusCode);
    // print(response);
  }


   static getUser(String id) async {
    var response = await Dio().get(Apis.userUrl + id);
    if(response.statusCode==200){
      // deal with data
       Users user =  Users.fromJson(response.data);
      return user;
    } else{
      // show toast msg
    }
    // print(response.statusCode);
    // print(response);
  }
}
