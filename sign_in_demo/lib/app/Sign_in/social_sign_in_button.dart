import 'package:flutter/cupertino.dart';
import 'package:sign_in_demo/Custom_widgets/custom_raised_Button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    // ignore: non_constant_identifier_names
    required String AssName,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssName),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15.0),
              ),
              Opacity(opacity: 0.0, child: Image.asset(AssName)),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
