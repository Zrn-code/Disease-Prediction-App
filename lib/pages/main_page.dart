import 'package:flutter/material.dart';
import 'package:flutter_application/pages/profile_page.dart';
import '../helper/helper_functions.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import '../services/auth_service.dart';
import 'login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final List<String> _items = ['BMI', 'Age', 'Initial Data'];
  String userName = "";
  String email = "";
  int _age = 0;
  double _bmi = 0;
  double _height = 0;
  double _weight = 0;
  bool isSwitched = false;
  String _selectedField = "BMI";
  int _selectedGender = -1;
  List<String> _gender = ["male", "female"];

  AuthService authService = AuthService();

  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Category',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            value: _selectedField,
                            items: _items.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedField = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (_selectedField == "Initial Data")
                            ToggleButtons(
                                children: [
                                  Text('Male'),
                                  Text('Female'),
                                ],
                                constraints: BoxConstraints(
                                  minWidth: 100,
                                  minHeight: 50,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                                selectedBorderColor: Colors.blue,
                                isSelected: _selectedGender == -1
                                    ? List.generate(
                                        _gender.length, (_) => false)
                                    : List.generate(_gender.length,
                                        (index) => index == _selectedGender),
                                onPressed: (int index) {
                                  setState(() {
                                    if (_selectedGender == index) {
                                      _selectedGender = -1;
                                    } else {
                                      _selectedGender = index;
                                    }
                                  });
                                }),
                          if (_selectedField == 'Age' ||
                              _selectedField == "Initial Data")
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: TextFormField(
                                autofocus: true,
                                controller: ageController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.cake_rounded),
                                  labelText: 'Age',
                                  hintText: 'Enter your age',
                                ),
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    // 使用空值判斷符號
                                    return 'Please enter your age';
                                  }
                                  if (int.tryParse(value!) == null) {
                                    // 使用 '!' 運算符號
                                    return 'Please enter a valid age';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _age = int.parse(value!); // 使用 '!' 運算符號
                                },
                              ),
                            ),
                          if (_selectedField == "BMI" ||
                              _selectedField == "Initial Data")
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: TextFormField(
                                autofocus: true,
                                controller: weightController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon:
                                      Icon(Icons.monitor_weight_rounded),
                                  labelText: 'Weight(kg)',
                                  hintText: 'Enter your weight in kg',
                                ),
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    // 使用空值判斷符號
                                    return 'Please enter your weight';
                                  }
                                  if (double.tryParse(value!) == null) {
                                    // 使用 '!' 運算符號
                                    return 'Please enter a valid weight';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _weight = double.parse(value!); // 使用 '!' 運算符號
                                },
                              ),
                            ),
                          if (_selectedField == "BMI" ||
                              _selectedField == "Initial Data")
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: TextFormField(
                                autofocus: true,
                                controller: heightController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.emoji_people_rounded),
                                  labelText: 'height(cm)',
                                  hintText: 'Enter your height',
                                ),
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    // 使用空值判斷符號
                                    return 'Please enter your height';
                                  }
                                  if (double.tryParse(value!) == null) {
                                    // 使用 '!' 運算符號
                                    return 'Please enter a valid height';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _height = double.parse(value!); // 使用 '!' 運算符號
                                },
                                onFieldSubmitted: (value) {
                                  if (_selectedField == 'BMI')
                                    _submitFormBMI();
                                  else if (_selectedField == "Initial Data") {
                                    _initialData();
                                  }
                                },
                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                onPressed: () {
                                  _formKey.currentState!.reset();
                                  heightController.clear();
                                  weightController.clear();
                                  ageController.clear();
                                  setState(() {
                                    _age = 0;
                                    _height = 0;
                                    _weight = 0;
                                  });
                                },
                                child: const Text('Reset'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_selectedField == "BMI") {
                                    _submitFormBMI();
                                  } else if (_selectedField == "Initial Data") {
                                    _initialData();
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                    minimumSize: Size(200, 50)),
                                child: Text("Submit Form".toUpperCase(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ])))));
  }

  void _initialData() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
    }
  }

  void _submitFormBMI() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      _calculateBMI();
      _showResult();
    }
  }

  void _calculateBMI() {
    double heightInMeters = _height / 100;
    _bmi = _weight / (heightInMeters * heightInMeters);
  }

  void _showResult() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your BMI is:',
                  style: TextStyle(fontSize: 24.0),
                ),
                Text(
                  _bmi.toStringAsFixed(1),
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
