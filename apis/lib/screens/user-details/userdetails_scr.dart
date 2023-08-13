import 'dart:ui';

import 'package:apis/controller/apiConfig.dart';
import 'package:apis/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserDetailsScreen extends StatefulWidget {
  static String routeName = '/UserDetailsScreen';
  const UserDetailsScreen({this.id});
  final int? id;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late Users myUser;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  getUsers() async {
    myUser = await ApiConfig.getUser(widget.id.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
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
                  // id
                  Row(
                    children: [
                      Text(
                        'Id'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        myUser.id.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // name
                  Row(
                    children: [
                      Text(
                        'Name'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        myUser.name ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Phone Number
                  Row(
                    children: [
                      Text(
                        'Phone Number'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        myUser.phone.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Email
                  Row(
                    children: [
                      Text(
                        'Email'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        myUser.email ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // company
                  Row(
                    children: [
                      Text(
                        'Company'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        myUser.company.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Address
                  Row(
                    children: [
                      Text(
                        'Address'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        myUser.address.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
