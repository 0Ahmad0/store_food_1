import 'package:flutter/material.dart';

Row buildRowSoshial() {
  return Row(
    children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                print('jrllll');
              },
              child: Image.asset('images/google.png',
                  width: 50.0, height: 50.0))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                print('jrllll');
              },
              child:
              Image.asset('images/face.png', width: 50.0, height: 50.0))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                print('jrllll');
              },
              child: Image.asset('images/gmail.png',
                  width: 50.0, height: 50.0))),
    ],
  );
}
////////////////////////////
class CustomeTextFiled extends StatelessWidget {

  final String hint;

  final IconData icon;

  final String? Function(String? val)? validate;

  final Function(String? val)? onChange;

  CustomeTextFiled({
    Key? key,
    required this.hint,
    required this.icon,
    this.validate,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          prefixIcon: Icon(icon),
          hintText: hint),
      onChanged: onChange,
      validator: validate,
    );
  }
}
///////////////////////////