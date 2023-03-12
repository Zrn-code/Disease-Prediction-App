import 'package:flutter/material.dart';
import '../pages/main_page.dart';
/*
List<String> _genderList = ["female", "male"];

class gender_DropdownButtonExample extends StatefulWidget {
  gender_DropdownButtonExample({super.key});
  @override
  State<gender_DropdownButtonExample> createState() =>
      gender_DropdownButtonExampleState();
}

class gender_DropdownButtonExampleState
    extends State<gender_DropdownButtonExample> {
  String dropdownValue = _genderList.first;

  // cough = '1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.

        if (value == 'male') {
          gender = '1';
        } else {
          gender = '0';
        }

        setState(() {
          dropdownValue = value!;
        });
      },
      items: _genderList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/