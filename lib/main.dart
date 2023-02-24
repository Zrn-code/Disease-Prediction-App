import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Disease Prediction Form'),
          centerTitle: true,
        ),
        body: const Center(
          child: FormExample(),
        ),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});
  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final items = ["model A", "model B", "model C"];

  String value = '';
  String dropdownValue = 'model A';
  bool isSwitched = false;
  bool optionsA = false;
  bool optionsB = false;
  String? radioValue = "1";

  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ageTextFiled = Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: ageController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.verified_outlined),
          labelText: '實際年齡(Required)',
        ),
        onChanged: (String text) {
          setState(() {
            value = "輸入的年齡: $text";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '年齡不得為空';
          }
          return null;
        },
      ),
    );

    var weightTextFiled = Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: weightController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.verified_outlined),
          labelText: '體重(Required)',
        ),
        onChanged: (String text) {
          setState(() {
            value = "輸入的體重: $text";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '體重不得為空';
          }
          return null;
        },
      ),
    );

    var heightTextFiled = Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: heightController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.verified_outlined),
          labelText: '身高(Required)',
        ),
        onChanged: (String text) {
          setState(() {
            value = "輸入的身高: $text";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '身高不得為空';
          }
          return null;
        },
      ),
    );

    var theRadio = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<String>(
          value: "1",
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value;
            });
          },
        ),
        Text("選項一"),
        Radio<String>(
          value: "2",
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value;
            });
          },
        ),
        Text("選項二"),
      ],
    );

    var theSwitch = Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: Colors.yellow,
      activeColor: Colors.orangeAccent,
    );

    var theCheckBox = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: optionsA,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              optionsA = value!;
            });
          },
        ),
        Text("A"),
        Checkbox(
          value: optionsB,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              optionsB = value!;
            });
          },
        ),
        Text("B"),
      ],
    );

    var theDropdownButton = Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: DropdownButtonFormField(
          value: dropdownValue,
          isExpanded: true,
          decoration: InputDecoration(
              labelText: "預測疾病",
              prefixIcon: Icon(
                Icons.accessibility_new_rounded,
                color: Colors.blue,
              )),
          dropdownColor: Colors.blue.shade50,
          icon: Icon(
            Icons.arrow_drop_down_circle_rounded,
            color: Colors.blue,
          ),
          onChanged: (String? value) {
            print(value);
            setState(() {
              dropdownValue = value!;
            });
          },
          items: items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ));

    var submit = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      style: OutlinedButton.styleFrom(minimumSize: Size(200, 50)),
      child: Text("Submit Form".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold)),
    );

    var reset = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.red),
      onPressed: () {
        _formKey.currentState!.reset();
        heightController.clear();
        weightController.clear();
        ageController.clear();
        setState(() {
          value = "";
          optionsA = false;
          optionsB = false;
          isSwitched = false;
          radioValue = "1";
          dropdownValue = "model A";
        });
      },
      child: const Text('重置'),
    );

    var buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        reset,
        submit,
      ],
    );

    var form = Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Disease Prediction",
          ),
          ageTextFiled,
          weightTextFiled,
          heightTextFiled,
          theDropdownButton,
          theSwitch,
          theCheckBox,
          theRadio,
          buttons,
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: form,
      ),
    );
  }
}
