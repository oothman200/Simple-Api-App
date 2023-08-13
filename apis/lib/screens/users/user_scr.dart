import 'package:apis/controller/apiConfig.dart';
import 'package:apis/models/user.dart';
import 'package:apis/screens/user-details/userdetails_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserScreen extends StatefulWidget {
  static String routeName = '/UserScreen';
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Users> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUsers() async {
    users = await ApiConfig.getUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: isLoading
          ? SpinKitRing(
              color: Colors.red,
              size: 50.0,
            )
          : ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: ((context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetailsScreen(id: users[index].id!),
                        ),
                      );
                    },
                    child: ListTile(
                      tileColor: Colors.green.shade50,
                      leading: Text(users[index].id.toString()),
                      title: Text(
                        users[index].name ?? '',
                        style: TextStyle(color: Colors.blue),
                      ),
                      subtitle: Text(
                        users[index].phone ?? '',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  )),
            ),
    );
  }
}
