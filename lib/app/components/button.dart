// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;

  const ButtonApp({super.key, required this.txt, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40))
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
        onPressed: onPressed,
        child: Text(txt, style: TextStyle(fontSize: 18),),
      ),
    );
  }
}