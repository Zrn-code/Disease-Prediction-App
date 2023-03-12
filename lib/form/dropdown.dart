import 'package:flutter/material.dart';
import '../pages/main_page.dart';

const List<String> list = <String>['Yes', 'No'];
const List<String> _genderList = <String>['Female', 'Male'];

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

class sore_throat_DropdownButtonExample extends StatefulWidget {
  const sore_throat_DropdownButtonExample({super.key});

  @override
  State<sore_throat_DropdownButtonExample> createState() =>
      sore_throat_DropdownButtonExampleState();
}

class sore_throat_DropdownButtonExampleState
    extends State<sore_throat_DropdownButtonExample> {
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
          sore_throat = '1';
        } else {
          sore_throat = '0';
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

class head_ache_DropdownButtonExample extends StatefulWidget {
  const head_ache_DropdownButtonExample({super.key});

  @override
  State<head_ache_DropdownButtonExample> createState() =>
      head_ache_DropdownButtonExampleState();
}

class head_ache_DropdownButtonExampleState
    extends State<head_ache_DropdownButtonExample> {
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
          head_ache = '1';
        } else {
          head_ache = '0';
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

class shortness_of_breath_DropdownButtonExample extends StatefulWidget {
  const shortness_of_breath_DropdownButtonExample({super.key});

  @override
  State<shortness_of_breath_DropdownButtonExample> createState() =>
      shortness_of_breath_DropdownButtonExampleState();
}

class shortness_of_breath_DropdownButtonExampleState
    extends State<shortness_of_breath_DropdownButtonExample> {
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
        if (value == 'Yes') {
          shortness_of_breath = '1';
        } else {
          shortness_of_breath = '0';
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

class age_60_and_above_DropdownButtonExample extends StatefulWidget {
  const age_60_and_above_DropdownButtonExample({super.key});

  @override
  State<age_60_and_above_DropdownButtonExample> createState() =>
      age_60_and_above_DropdownButtonExampleState();
}

class age_60_and_above_DropdownButtonExampleState
    extends State<age_60_and_above_DropdownButtonExample> {
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
        if (value == 'Yes') {
          age_60_and_above = '1';
        } else {
          age_60_and_above = '0';
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

class gender_DropdownButtonExample extends StatefulWidget {
  const gender_DropdownButtonExample({super.key});

  @override
  State<gender_DropdownButtonExample> createState() =>
      gender_DropdownButtonExampleState();
}

class gender_DropdownButtonExampleState
    extends State<gender_DropdownButtonExample> {
  String dropdownValue = _genderList.first;
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
        if (value == 'Male') {
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

class test_indication_DropdownButtonExample extends StatefulWidget {
  const test_indication_DropdownButtonExample({super.key});

  @override
  State<test_indication_DropdownButtonExample> createState() =>
      test_indication_DropdownButtonExampleState();
}

class test_indication_DropdownButtonExampleState
    extends State<test_indication_DropdownButtonExample> {
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
        if (value == 'Yes') {
          test_indication = '1';
        } else {
          test_indication = '0';
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
