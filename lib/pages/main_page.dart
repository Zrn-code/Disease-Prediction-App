import 'package:flutter/material.dart';
import 'package:flutter_application/pages/profile_page.dart';
import '../helper/helper_functions.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  String getId(String res) {
    return res.substring(0, res.indexOf('_'));
  }

  String getName(String res) {
    return res.substring(res.indexOf('_') + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((value) {
      setState(() {
        userName = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Disease Prediction Form'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.grey[700],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                userName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 2,
              ),
              ListTile(
                  onTap: () {},
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.local_hospital),
                  selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  title: const Text(
                    "Disease Prediction",
                    style: TextStyle(color: Colors.black),
                  )),
              ListTile(
                  onTap: () {
                    nextScreen(
                        context,
                        ProfilePage(
                          email: email,
                          userName: userName,
                        ));
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.person),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  )),
              ListTile(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Logout"),
                            content:
                                const Text("Are you sure you want to logout?"),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    await authService.signOut();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()),
                                        (route) => false);
                                  },
                                  icon: const Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  )),
                            ],
                          );
                        });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
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
  String userName = "";
  String email = "";
  bool isSwitched = false;
  bool optionsA = false;
  bool optionsB = false;
  String? radioValue = "1";
  AuthService authService = AuthService();

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
          prefixIcon: Icon(Icons.cake_rounded),
          labelText: 'Age(Required)',
        ),
        onChanged: (String text) {
          setState(() {
            value = "Input age: $text.";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "age cannot be null.";
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
          prefixIcon: Icon(Icons.monitor_weight_rounded),
          labelText: 'Weight(Required)',
        ),
        onChanged: (String text) {
          setState(() {
            value = "Input Weight: $text.";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Weight cannot be null.';
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
          prefixIcon: Icon(Icons.emoji_people_rounded),
          labelText: 'Height(Required)',
        ),
        onChanged: (String text) {
          setState(() {
            value = "Input height: $text.";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Height cannot be null.';
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
        Text("Choice 1"),
        Radio<String>(
          value: "2",
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value;
            });
          },
        ),
        Text("Choice 2"),
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
              labelText: "Predict Disease Type",
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
      child: const Text('Reset'),
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
