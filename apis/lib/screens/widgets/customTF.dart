
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.keyboardType = TextInputType.name,
    this.isFilled = true,
    this.fillColor = Colors.grey,
    this.hintText = '',
    this.prefixIcon,
    this.supfixIcon,
    this.isSecure = false,
    this.controller,
  });

  TextInputType keyboardType;
  bool isFilled;
  Color fillColor;
  String hintText;
  Widget? prefixIcon;
  Widget? supfixIcon;
  bool isSecure;
  TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText:  widget.isSecure? isHidden : false ,
      //initialValue: '',
      style: TextStyle(color: Colors.red),

      validator: (value){
        var message;
        if(value==null || value.isEmpty){
          message = 'requrid';
        }
        return message;
      },
      decoration: InputDecoration(
        filled: widget.isFilled,
        //fillColor: Color(0xFFF0F0F0),
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        // prefixIcon: Image.asset('assets/icons/email_ic.png') ,
        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.isSecure != true
        ? null
        :IconButton(
          onPressed: () {
            setState(() {
              isHidden =!isHidden;
            });
          },
           icon: isHidden
            ? Icon(Icons.visibility_off , color: Colors.grey)
            : Icon(Icons.visibility , color: Colors.grey),
           ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black),
          //color: Colors.transparent,
        ),
      ),
    );
  }
}
