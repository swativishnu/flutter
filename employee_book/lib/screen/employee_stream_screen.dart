import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Data/local/DB/app_db.dart';

class EmployeeStreamScreen extends StatefulWidget {
  const EmployeeStreamScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeStreamScreen> createState() => _EmployeeStreamScreenState();
}

class _EmployeeStreamScreenState extends State<EmployeeStreamScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Stream'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<EmployeeData>>(
        stream: Provider.of<AppDb>(context).getEmployeeStream(),
        builder: (context, snapshot) {
          final List<EmployeeData>? employees = snapshot.data;

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (employees != null) {
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
                              DateFormat('dd/MM/yyyy')
                                  .format(employee.dateOfBirth)
                                  .toString(),
                              style: const TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }

          return const Text('No Data Found');
        },
      ),
    );
  }
}
