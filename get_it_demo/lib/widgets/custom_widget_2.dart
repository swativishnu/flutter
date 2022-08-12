import 'package:flutter/material.dart';

import '../service.dart';
import '../service_locator.dart';

class MyCustomWidget2 extends StatelessWidget {
  var instance = locator<APIService>();

  MyCustomWidget2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(instance.fetchData),
    );
  }
}
