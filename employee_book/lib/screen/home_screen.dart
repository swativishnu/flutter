import 'package:employee_book/screen/employee_future_screen.dart';
import 'package:employee_book/screen/employee_stream_screen.dart';
import 'package:flutter/material.dart';

import '../Data/local/DB/app_db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late AppDb _db;
  final pages = const [
    EmployeeFututreScreen(),
    EmployeeStreamScreen(),
  ];
  @override
  void initState() {
    _db = AppDb();
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home screen'),
      //   centerTitle: true,
      // ),
      body: pages[index],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee');
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Employee"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.blue.shade300,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_outlined),
              label: 'Employee Future',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_outlined),
              label: 'Employee stream',
            ),
          ]),
    );
  }
}
