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
    late final employees = get<EmployeeChangeNotifier>().employeeListFuture;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Future'),
        centerTitle: true,
      ),
      body: // FutureBuilder<List<employees>>(
          ListView.builder(
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
      ),
    );
  }
}
