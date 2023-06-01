import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_application/pages/main_page.dart';
import 'package:flutter_application/pages/login_page.dart';

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
    dropdownValue = "Choose ${widget.list.first}";
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
            lang_map[lang]!["Select your answer"],
            style: const TextStyle(
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
              return 'Please select ${widget.labelText}';
            }
            return null;
          },
          onChanged: (String? value) {
            if (value == lang_map[lang]!['Excellent']) {
              widget.onChanged('4');
            } else if (value == lang_map[lang]!['Very Good']) {
              widget.onChanged('3');
            } else if (value == lang_map[lang]!['Good']) {
              widget.onChanged('2');
            } else if (value == lang_map[lang]!['Poor']) {
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

Widget buildRow(String label, Function onChanged) {
  List<String> list = [
    lang_map[lang]!['Excellent'],
    lang_map[lang]!['Very Good'],
    lang_map[lang]!['Good'],
    lang_map[lang]!['Fair'],
    lang_map[lang]!['Poor'],
  ];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
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
