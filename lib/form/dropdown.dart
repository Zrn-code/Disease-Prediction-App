import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

const List<Widget> fruits = <Widget>[Text('Apple'), Text('Banana')];

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
    dropdownValue = "Choose " + widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        DropdownButtonFormField2(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          isExpanded: true,
          barrierColor: Colors.black.withOpacity(0.5),
          hint: Text(
            "Select " + widget.labelText,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
                fontWeight: FontWeight.bold),
          ),
          items: widget.list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select ' + widget.labelText;
            }
            return null;
          },
          onChanged: (String? value) {
            if (value == 'Yes' || value == 'Male') {
              widget.onChanged('1');
            } else {
              widget.onChanged('0');
            }
            if (value == 'Excellent')
              widget.onChanged('4');
            else if (value == 'Very Good')
              widget.onChanged('3');
            else if (value == 'Good')
              widget.onChanged('2');
            else if (value == 'Poor')
              widget.onChanged('1');
            else if (value == 'Fair') widget.onChanged('0');

            setState(() {
              dropdownValue = value!;
            });
          },
          buttonStyleData: const ButtonStyleData(
            height: 60,
            padding: EdgeInsets.only(left: 20, right: 10),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildRow(String label, Function onChanged) {
  var list = ['Yes', 'No'];
  if (label == 'General Health:')
    list = [
      'Excellent',
      'Very Good',
      'Good',
      'Poor',
      'Fair',
    ];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 20,
      ),
      CustomDropdownButtonExample(
        labelText: label,
        list: list,
        onChanged: onChanged,
      ),
    ],
  );
}
