import 'package:flutter/material.dart';

class ReUsableButton extends StatelessWidget {
  ReUsableButton(
      {required this.color, required this.onPressed, required this.text});
  final Color color;
  final onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
