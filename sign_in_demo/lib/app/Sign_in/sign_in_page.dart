// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sign_in_demo/Custom_widgets/custom_raised_Button.dart';
import 'package:sign_in_demo/app/Sign_in/sigh_in_button.dart';
import 'package:sign_in_demo/app/Sign_in/social_sign_in_button.dart';

//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[200],
    );
  }
}

Widget _buildContainer() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 48.0),
        SocialSignInButton(
          // ignore: sort_child_properties_last
          AssName: 'images/google-logo.png',
          text: 'Sign In with google',
          color: Colors.white,
          textColor: Colors.black87,
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        SocialSignInButton(
          // ignore: sort_child_properties_last
          AssName: 'images/facebook-logo.png',
          text: 'Sign In with Facebook',
          textColor: Colors.white,
          color: Color(0xFF334D92),
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        SignInButton(
          // ignore: sort_child_properties_last
          text: 'Sign In with email',
          textColor: Colors.white,
          color: Color.fromARGB(255, 110, 234, 219),
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        Text(
          'or',
          style: TextStyle(fontSize: 14, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        SignInButton(
          // ignore: sort_child_properties_last
          text: 'Go anonymous',
          textColor: Colors.black,
          color: Color.fromARGB(255, 223, 235, 119),
          onPressed: () {},
        ),
      ],
    ),
  );
}
