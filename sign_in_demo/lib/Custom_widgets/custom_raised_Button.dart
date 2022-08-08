// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  CustomRaisedButton({
    required this.child,
    required this.color,
    this.borderRadius = 2.0,
    required this.onPressed,
    this.height = 50.0,
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
