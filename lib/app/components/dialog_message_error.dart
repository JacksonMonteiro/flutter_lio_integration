// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class DialogMessageError extends StatefulWidget {
  final String message;
  final Function()? closeDialog;

  const DialogMessageError({Key? key, required this.message, this.closeDialog})
      : super(key: key);

  @override
  _DialogMessageErrorState createState() => _DialogMessageErrorState();
}

class _DialogMessageErrorState extends State<DialogMessageError> {
  @override
  void dispose() {
    super.dispose();
    if (widget.closeDialog != null) {
      widget.closeDialog!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 29),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ))
            // )
            ));
  }
}
