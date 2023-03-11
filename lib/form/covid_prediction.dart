import 'package:flutter/material.dart';
import '../pages/main_page.dart';

const List<String> list = <String>['Yes', 'No'];

class cough_DropdownButtonExample extends StatefulWidget {
  cough_DropdownButtonExample({super.key});
  @override
  State<cough_DropdownButtonExample> createState() =>
      cough_DropdownButtonExampleState();
}

class cough_DropdownButtonExampleState
    extends State<cough_DropdownButtonExample> {
  String dropdownValue = list.first;

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
        if (value == 'Yes') {
          cough = '1';
        } else {
          cough = '0';
        }
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class fever_DropdownButtonExample extends StatefulWidget {
  const fever_DropdownButtonExample({super.key});

  @override
  State<fever_DropdownButtonExample> createState() =>
      fever_DropdownButtonExampleState();
}

class fever_DropdownButtonExampleState
    extends State<fever_DropdownButtonExample> {
  String dropdownValue = list.first;
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
        // url = 'https://flask-app-test-yqkj.onrender.com/api?cough=0&fever=';
        if (value == 'Yes') {
          fever = '1';
        } else {
          fever = '0';
        }
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
