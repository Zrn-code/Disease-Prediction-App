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
            if (value == 'typical angina')
              widget.onChanged('1');
            else if (value == 'atypical angina')
              widget.onChanged('2');
            else if (value == 'non-anginal pain')
              widget.onChanged('3');
            else if (value == 'asymptomatic') widget.onChanged('4');

            if (value == 'upsloping')
              widget.onChanged('0');
            else if (value == 'flat')
              widget.onChanged('1');
            else if (value == 'downsloping') widget.onChanged('2');
            if (value == 'Excellent')
              widget.onChanged('4');
            else if (value == 'Very Good')
              widget.onChanged('3');
            else if (value == 'Good')
              widget.onChanged('2');
            else if (value == 'Poor')
              widget.onChanged('1');
            else if (value == 'Fair') widget.onChanged('0');

            if (value == 'greater than 120mg/ml')
              widget.onChanged('1');
            else if (value == 'less than 120mg/ml') widget.onChanged('0');

            if (value == 'normal')
              widget.onChanged('0');
            else if (value == 'ST-T wave abnormality')
              widget.onChanged('1');
            else if (value == 'left ventricular hypertrophy')
              widget.onChanged('2');

            if (value == '0')
              widget.onChanged('0');
            else if (value == '1')
              widget.onChanged('1');
            else if (value == '2')
              widget.onChanged('2');
            else if (value == '3') widget.onChanged('3');
            if (value == "YES")
              widget.onChanged('2');
            else if (value == "NO") widget.onChanged('1');
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
