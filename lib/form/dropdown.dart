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

/*
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
*/
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
        Text(widget.labelText),
        DropdownButtonFormField2(
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
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
