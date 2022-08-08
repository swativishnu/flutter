import 'package:flutter/cupertino.dart';
import 'package:sign_in_demo/Custom_widgets/custom_raised_Button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
          child: Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
          color: color,
          onPressed: onPressed,
        );
}
