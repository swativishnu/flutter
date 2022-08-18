import 'package:employee_book/Data/local/DB/app_db.dart';
import 'package:employee_book/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';

import '../notifier/employee_change_notifier.dart';

class EmployeeNotifierFututreScreen extends StatelessWidget with GetItMixin {
  EmployeeNotifierFututreScreen({
    Key? key,
  }) : super(key: key);

  //late final itemCount= employees.length;

  @override
  Widget build(BuildContext context) {
    // final List employees = get<EmployeeChangeNotifier>().getEmployeeFuture();
    final List employees =
        watch<ValueListenable<List>, List>(instanceName: 'Employees');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Future'),
        centerTitle: true,
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: builder_method(employees),
        );
      }),
    );
  }

  // ignore: non_constant_identifier_names
  ListView builder_method(List employees) {
    // ignore: avoid_print
    print(employees.isEmpty);
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/edit_employee',
                arguments: employee.id);
          },
          child: Card(
            color: Colors.grey.shade300,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.green,
                width: 1.2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.id.toString(),
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                  Text(
                    employee.userName.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 208, 68, 17)),
                  ),
                  Text(
                    employee.firstName.toString(),
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                  Text(
                    employee.lastName.toString(),
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(employee.dateOfBirth),
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
