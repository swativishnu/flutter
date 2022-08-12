import 'package:flutter/material.dart';
import 'package:get_it_demo/widgets/custom_widget_1.dart';
import 'package:get_it_demo/widgets/custom_widget_2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo GetIt'),
      ),
      body: Column(children: [
        const Text('Some Data1'),
        const Text('Some Data2'),
        const MyCustomWidget1(),
        MyCustomWidget2(),
      ]),
    );
  }
}
