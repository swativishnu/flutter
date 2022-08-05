import 'package:flutter/material.dart';
import 'package:sign_in_demo/aco/sign_in_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SignInPage(),
    );
  }
}
