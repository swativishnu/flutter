import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Data/local/DB/app_db.dart';
import '../injection_container.dart';

class EmployeeFututreScreen extends StatefulWidget {
  const EmployeeFututreScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeFututreScreen> createState() => _EmployeeFututreScreenState();
}

class _EmployeeFututreScreenState extends State<EmployeeFututreScreen> {
  //late AppDb _db;
  final _dbObj = sl<AppDb>();

  @override
  void initState() {
    // _db = AppDb();
    super.initState();
  }

  @override
  void dispose() {
    //   _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Future'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeData>>(
        //future: _db.getEmployees(),
        future: _dbObj.getEmployees(),
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
                                  .format(employee.dateOfBirth),
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
