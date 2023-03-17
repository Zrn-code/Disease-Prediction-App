import 'package:flutter/material.dart';
import '../pages/main_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownButtonExample extends StatefulWidget {
  final String labelText;
  final List<String> list;
  final Function onChanged;

  const CustomDropdownButtonExample({
    Key? key,
    required this.labelText,
    required this.list,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownButtonExample> createState() =>
      CustomDropdownButtonExampleState();
}

class CustomDropdownButtonExampleState
    extends State<CustomDropdownButtonExample> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Text(widget.labelText),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.green),
          underline: Container(
            height: 2,
            color: Colors.green,
          ),
          onChanged: (String? value) {
            if (value == 'Yes' || value == 'Male') {
              widget.onChanged('1');
            } else {
              widget.onChanged('0');
            }
            setState(() {
              dropdownValue = value!;
            });
          },
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
