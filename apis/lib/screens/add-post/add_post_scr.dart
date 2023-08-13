import 'package:apis/controller/apiConfig.dart';
import 'package:apis/screens/widgets/customTF.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  static String routeName = '/AddPostScreen ';
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final formkey = GlobalKey<FormState>();
  var titleCtr = TextEditingController();
  var bodyCtr = TextEditingController();
  var idCtr = TextEditingController();
  //
  addPost () async{
    Map<String,dynamic> bodyData = {};
    bodyData['title'] = titleCtr.text;
    bodyData['body'] = bodyCtr.text;
    bodyData['id'] = idCtr.text;

    //
    print(bodyData);
     await ApiConfig.addPost(bodyData);
    //

  }
  //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //
              CustomTextField(
                controller: titleCtr,
                fillColor: Colors.grey.shade100,
              ),
              //
        
              SizedBox(height: 20),
              Text(
                'Enter Your body',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //
              CustomTextField(
                controller: bodyCtr,
                fillColor: Colors.grey.shade100,
              ),
        
              //
              SizedBox(height: 20),
              Text(
                'Enter Your id',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //
              CustomTextField(
                controller: idCtr,
                fillColor: Colors.grey.shade100,
              ),
              //
              
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      addPost();
                    } else{
                      print('error');
                    }
                  },
                  child: Text('Add Post'),
                ),
              ),
              SizedBox(height: 20),
              Text('data from server'),
            ],
          ),
        ),
      ),
    );
  }
}
