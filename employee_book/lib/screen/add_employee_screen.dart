//import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/custom_text_form_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateofBirthController = TextEditingController();
  DateTime? _dateOfBirth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          CustomTextFormField(
            controller: _userNameController,
            txtLable: 'User Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          CustomTextFormField(
            controller: _firstNameController,
            txtLable: 'first Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          CustomTextFormField(
            controller: _lastNameController,
            txtLable: 'Last Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _dateofBirthController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Date of Birth'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Data of Birth  can not be Empty';
              }
              return null;
            },
            onTap: () => pickDateOfBirth(context),
          ),
          // CustomDatePickerFormField(
          //     controller: _dateofBirthController,
          //     txtLabel: 'Date of Birth',
          //     callback: () {
          //       pickDateOfBirth(context);
          //     }),
        ]),
      ),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfBirth ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.pink,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child ?? const Text(''),
            ));

    if (newDate == null) {
      return;
    }

    setState(() {
      _dateOfBirth = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateofBirthController.text = dob;
    });
  }
}