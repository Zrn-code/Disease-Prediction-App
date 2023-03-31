import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/profile_page.dart';
import '../helper/helper_functions.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import '../services/auth_service.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../helper/function.dart';
import '../form/dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

String cough = '1';
String fever = '1';
String sore_throat = '1';
String shortness_of_breath = '1';
String head_ache = '1';
String age_60_and_above = '1';
String test_indication = '1';
String gender = '0';
String Polyuria = '1';
String Polydipsia = '1';
String sudden_weight_loss = '1';
String weakness = '1';
String Polyphagia = '1';
String Genital_thrush = '1';
String visual_blurring = '1';
String Itching = '1';
String Irritability = '1';
String delayed_healing = '1';
String partial_paresis = '1';
String muscle_stiffness = '1';
String Alopecia = '1';
String Obesity = '1';
String cp = "1";
double trtbps = 0;
double chol = 0;
String fbs = "1";
String restecg = "1";
double thalachh = 0;
String exng = "1";
double oldpeak = 0;
String slp = "1";
String caa = "1";
String thall = "1";
String GENDER = "1";
String AGE = "1";
String SMOKING = "1";
String YELLOW_FINGERS = "1";
String ANXIETY = "1";
String PEER_PRESSURE = "1";
String CHRONIC_DISEASE = "1";
String FATIGUE = "1";
String ALLERGY = "1";
String WHEEZING = "1";
String ALCOHOL_CONSUMING = "1";
String COUGHING = "1";
String SHORTNESS_OF_BREATH = "1";
String SWALLOWING_DIFFICULTY = "1";
String CHEST_PAIN = "1";

final List<String> _items = ['Prediction', 'Other Function'];
String _selectedValue = "Prediction";
String url_A = 'https://flask-app-test-yqkj.onrender.com/api?';
String url_B = 'https://early-stage-diabetes-risk-prediction.onrender.com/api?';
// https://heart-attack-analysis-prediction.onrender.com/api?age=63&sex=1&cp=3&trtbps=145&chol=233&fbs=1&restecg=0&thalachh=150&exng=0&oldpeak=2.3&slp=0&caa=0&thall=1
String url_C = 'https://heart-attack-analysis-prediction.onrender.com/api?';
// https://lung-cancer-808h.onrender.com/api?GENDER=1&AGE=50&SMOKING=2&YELLOW_FINGERS=1&ANXIETY=1&PEER_PRESSURE=1&CHRONIC_DISEASE=1&FATIGUE=2&ALLERGY=2&WHEEZING=1&ALCOHOL_CONSUMING=2&COUGHING=2&SHORTNESS_OF_BREATH=1&SWALLOWING_DIFFICULTY=1&CHEST_PAIN=1
String url_D = 'https://lung-cancer-808h.onrender.com/api?';

int _age = 0;
double _bmi = 0;
double _height = 0;
double _weight = 0;

class _MainPageState extends State<MainPage> {
  String userName = "";
  String email = "";
  int age = 0;
  double height = 0;
  double weight = 0;
  final uid = "";

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
                  onTap: () async {
                    nextScreen(
                        context,
                        ProfilePage(
                          email: email,
                          userName: userName,
                          age: await DatabaseService(
                                  uid: FirebaseAuth.instance.currentUser!.uid)
                              .getAge(email),
                          height: await DatabaseService(
                                  uid: FirebaseAuth.instance.currentUser!.uid)
                              .getHeight(email),
                          weight: await DatabaseService(
                                  uid: FirebaseAuth.instance.currentUser!.uid)
                              .getWeight(email),
                          //gender: await DatabaseService(
                          //uid: FirebaseAuth.instance.currentUser!.uid)
                          //.getGender(email),
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
  final List<String> _items = ['Prediction', 'Other Function'];

  String output = 'Prediction';
  bool isSwitched = false;

  String _selectedField = "Prediction";

  List<String> _genderList = ["male", "female"];

  AuthService authService = AuthService();

  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController trtbpsController = TextEditingController();
  TextEditingController cholController = TextEditingController();
  TextEditingController thalachhController = TextEditingController();
  TextEditingController oldpeakController = TextEditingController();
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
                            value: (_selectedField == "Prediction A" ||
                                    _selectedField == "Prediction B" ||
                                    _selectedField == "Prediction C" ||
                                    _selectedField == "Prediction D")
                                ? "Prediction"
                                : (_selectedField == "BMI" ||
                                        _selectedField == "Initial Data")
                                    ? "Other Function"
                                    : _selectedField,
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
                          const SizedBox(
                            height: 20,
                          ),
                          if (_selectedField == "Prediction")
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 150.0,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedField = "Prediction A";
                                            });
                                          },
                                          child: Text('Covid Prediction'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.0,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedField = "Prediction B";
                                            });
                                          },
                                          child: Text("Diabetes mellitus"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 150.0,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedField = "Prediction C";
                                            });
                                          },
                                          child: Text('Heart Disease'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.0,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedField = "Prediction D";
                                            });
                                          },
                                          child: Text('Kidney Disease'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (_selectedField == "Prediction A")
                            prediction_A_Form(),
                          if (_selectedField == "Prediction B")
                            prediction_B_Form(),
                          if (_selectedField == "Prediction C")
                            prediction_C_Form(),
                          if (_selectedField == "Prediction D")
                            prediction_D_Form(),
                          if (_selectedField == "Initial Data")
                            initialDataForm(),
                          if (_selectedField == "BMI") bmiForm(),
                          if (_selectedField == "Other Function")
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 150.0,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedField = "BMI";
                                            });
                                          },
                                          child: Text('BMI'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.0,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedField = "Initial Data";
                                            });
                                          },
                                          child: Text('Initial Your Data'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(height: 16.0),
                          if (_selectedField != "Prediction" &&
                              _selectedField != "Other Function")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_selectedField == "BMI") {
                                      _submitFormBMI();
                                    } else if (_selectedField ==
                                        "Initial Data") {
                                      _initialData();
                                    } else if (_selectedField ==
                                        "Prediction A") {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState!.save();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "your data has been submitted."),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                        _submitPredictionA(url_A);
                                      }
                                    } else if (_selectedField ==
                                        "Prediction B") {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState!.save();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "your data has been submitted."),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                        _submitPredictionB(url_B);
                                      }
                                    } else if (_selectedField ==
                                        "Prediction C") {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState!.save();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "your data has been submitted."),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                        _submitPredictionC(url_C);
                                      }
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(200, 50)),
                                  child: Text("Submit Form".toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          if (_selectedField != "Prediction" &&
                              _selectedField != "Other Function")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_selectedField == "BMI") {
                                      _submitFormBMI();
                                    } else if (_selectedField ==
                                        "Initial Data") {
                                      _initialData();
                                    } else if (_selectedField ==
                                            "Prediction A" ||
                                        _selectedField == "Prediction B" ||
                                        _selectedField == "Prediction C" ||
                                        _selectedField == "Prediction D") {
                                      setState(() {
                                        _selectedField = "Prediction";
                                      });
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(150, 50),
                                      backgroundColor: Colors.red),
                                  child: Text("Return To Menu".toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                        ])))));
  }

  Future<void> _submitPredictionA(String url) async {
    url += 'cough=';
    url += cough;
    url += '&fever=';
    url += fever;
    url += '&sore_throat=';
    url += sore_throat;
    url += '&shortness_of_breath=';
    url += shortness_of_breath;
    url += '&head_ache=';
    url += head_ache;
    url += '&age_60_and_above=';
    url += age_60_and_above;
    url += '&gender=';
    url += gender;
    url += '&test_indication=';
    url += test_indication;
    var data = await fetchData(url);
    var decoded = jsonDecode(data);
    print(url);
    setState(() {
      output = decoded['output'];
    });
    _showResult("Probability of Covid :", output);
  }

//https://early-stage-diabetes-risk-prediction.onrender.com/api?Age=20&Gender=0&Polyuria=0&Polydipsia=0&sudden_weight_loss=0&weakness=0&Polyphagia=0&Genital_thrush=0&visual_blurring=0&Itching=0&Irritability=0&delayed_healing=0&partial_paresis=0&muscle_stiffness=0&Alopecia=0&Obesity=0
  Future<void> _submitPredictionB(String url) async {
    url += 'Age=';
    url += _age.toString();
    url += '&Gender=';
    url += gender;
    url += '&Polyuria=';
    url += Polyuria;
    url += '&Polydipsia=';
    url += Polydipsia;
    url += '&sudden_weight_loss=';
    url += sudden_weight_loss;
    url += '&weakness=';
    url += weakness;
    url += '&Polyphagia=';
    url += Polyphagia;
    url += '&Genital_thrush=';
    url += Genital_thrush;
    url += '&visual_blurring=';
    url += visual_blurring;
    url += '&Itching=';
    url += Itching;
    url += '&Irritability=';
    url += Irritability;
    url += '&delayed_healing=';
    url += delayed_healing;
    url += '&partial_paresis=';
    url += partial_paresis;
    url += '&muscle_stiffness=';
    url += muscle_stiffness;
    url += '&Alopecia=';
    url += Alopecia;
    url += '&Obesity=';
    url += Obesity;
    var data = await fetchData(url);
    var decoded = jsonDecode(data);
    print(url);
    setState(() {
      output = decoded['output'];
    });
    _showResult("Probability of Diabetes mellitus:", output);
  }

  // https://heart-attack-analysis-prediction.onrender.com/api?age=63&sex=1&cp=3&trtbps=145&chol=233&fbs=1&restecg=0&thalachh=150&exng=0&oldpeak=2.3&slp=0&caa=0&thall=1
  Future<void> _submitPredictionC(String url) async {
    url += 'age=';
    url += _age.toString();
    url += '&sex=';
    url += gender;
    url += '&cp=';
    url += cp;
    url += '&trtbps=';
    url += trtbps.toString();
    url += '&chol=';
    url += chol.toString();
    url += '&fbs=';
    url += fbs;
    url += '&restecg=';
    url += restecg;
    url += '&thalachh=';
    url += thalachh.toString();
    url += '&exng=';
    url += exng;
    url += '&oldpeak=';
    url += oldpeak.toString();
    url += '&slp=';
    url += slp;
    url += '&caa=';
    url += caa;
    url += '&thall=';
    url += thall;
    print(url);
    var data = await fetchData(url);
    var decoded = jsonDecode(data);
    //print(url);
    setState(() {
      output = decoded['output'];
    });
    _showResult("Probability of Heart Attack:", output);
  }

  void _initialData() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .initialUserData(
        _height,
        _weight,
        _age,
        //_genderList[gender],
      );
      _showMore("Your data has been record!");
    }
  }

  void _submitFormBMI() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      _calculateBMI();
      _showResult("Your BMI is:", _bmi.toStringAsFixed(1));
    }
  }

  void _calculateBMI() {
    double heightInMeters = _height / 100;
    _bmi = _weight / (heightInMeters * heightInMeters);
  }

  void _showResult(String message, String result) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          decoration: const BoxDecoration(
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
                  message,
                  style: const TextStyle(fontSize: 24.0),
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMore(String message) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final double screenWidth = MediaQuery.of(context).size.width;
        final double buttonWidth = (screenWidth - 64.0) / 3.0;
        final List<String> buttonNames = [
          "Prediction A",
          "Prediction B",
          "Prediction C",
          "Prediction D"
        ];

        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Your data has been recorded!',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: GridView.count(
                  crossAxisCount: (screenWidth / buttonWidth).ceil(),
                  shrinkWrap: true,
                  children: List.generate(buttonNames.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text(buttonNames[index]),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _selectedField = buttonNames[index];
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container prediction_A_Form() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRow('Cough:', (value) {
              setState(() {
                cough = value;
              });
            }),
            _buildRow('Fever:', (value) {
              setState(() {
                fever = value;
              });
            }),
            _buildRow('Sore Throat:', (value) {
              setState(() {
                sore_throat = value;
              });
            }),
            _buildRow('Shortness of Breath:', (value) {
              setState(() {
                shortness_of_breath = value;
              });
            }),
            _buildRow('Age is greater than 60:', (value) {
              setState(() {
                age_60_and_above = value;
              });
            }),
            _buildRow('Gender:', (value) {
              setState(() {
                gender = value;
              });
            }),
            _buildRow('Test Indication:', (value) {
              setState(() {
                test_indication = value;
              });
            }),
          ]),
    );
  }

  Container prediction_B_Form() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputAgeForm(),
            _buildRow('Gender:', (value) {
              setState(() {
                gender = value;
              });
            }),
            _buildRow('Polyuria:', (value) {
              setState(() {
                Polyuria = value;
              });
            }),
            _buildRow('Polydipsia:', (value) {
              setState(() {
                Polydipsia = value;
              });
            }),
            _buildRow('Sudden weight loss:', (value) {
              setState(() {
                sudden_weight_loss = value;
              });
            }),
            _buildRow('Polyphagia:', (value) {
              setState(() {
                Polyphagia = value;
              });
            }),
            _buildRow('Genital thrush:', (value) {
              setState(() {
                Genital_thrush = value;
              });
            }),
            _buildRow('Visual blurring:', (value) {
              setState(() {
                visual_blurring = value;
              });
            }),
            _buildRow('Itching:', (value) {
              setState(() {
                Itching = value;
              });
            }),
            _buildRow('Irritability:', (value) {
              setState(() {
                Irritability = value;
              });
            }),
            _buildRow('Delayed healing:', (value) {
              setState(() {
                delayed_healing = value;
              });
            }),
            _buildRow('Partial paresis:', (value) {
              setState(() {
                partial_paresis = value;
              });
            }),
            _buildRow('Muscle stiffness:', (value) {
              setState(() {
                muscle_stiffness = value;
              });
            }),
            _buildRow('Alopecia:', (value) {
              setState(() {
                Alopecia = value;
              });
            }),
            _buildRow('Obesity:', (value) {
              setState(() {
                Obesity = value;
              });
            }),
          ]),
    );
  }

  // https://heart-attack-analysis-prediction.onrender.com/api?age=63&sex=1&cp=3&trtbps=145&chol=233&fbs=1&restecg=0&thalachh=150&exng=0&oldpeak=2.3&slp=0&caa=0&thall=1
  Container prediction_C_Form() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputAgeForm(),
            inputTrtbpsForm(),
            inputCholForm(),
            inputThalachhForm(),
            inputOldpeakForm(),
            _buildRow('Gender:', (value) {
              setState(() {
                gender = value;
              });
            }),
            _buildRow('Chest Pain type chest pain type:', (value) {
              setState(() {
                cp = value;
              });
            }),
            _buildRow('Fasting blood sugar > 120 mg/dl:', (value) {
              setState(() {
                fbs = value;
              });
            }),
            _buildRow('Resting electrocardiographic results:', (value) {
              setState(() {
                restecg = value;
              });
            }),
            _buildRow('Exercise induced angina:', (value) {
              setState(() {
                exng = value;
              });
            }),
            _buildRow('Slope:', (value) {
              setState(() {
                slp = value;
              });
            }),
            _buildRow('Number of major vessels:', (value) {
              setState(() {
                caa = value;
              });
            }),
            _buildRow('Thal rate:', (value) {
              setState(() {
                thall = value;
              });
            }),
          ]),
    );
  }

  Container prediction_D_Form() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRow('Cough:', (value) {
              setState(() {
                cough = value;
              });
            }),
            _buildRow('Fever:', (value) {
              setState(() {
                fever = value;
              });
            }),
            _buildRow('Sore Throat:', (value) {
              setState(() {
                sore_throat = value;
              });
            }),
            _buildRow('Shortness of Breath:', (value) {
              setState(() {
                shortness_of_breath = value;
              });
            }),
            _buildRow('Age is greater than 60:', (value) {
              setState(() {
                age_60_and_above = value;
              });
            }),
            _buildRow('Gender:', (value) {
              setState(() {
                gender = value;
              });
            }),
            _buildRow('Test Indication:', (value) {
              setState(() {
                test_indication = value;
              });
            }),
          ]),
    );
  }

  Container bmiForm() {
    return Container(
      child: Column(
        children: [inputHeightForm(), inputWeightForm()],
      ),
    );
  }

  Container initialDataForm() {
    return Container(
      child: Column(
          children: [inputAgeForm(), inputHeightForm(), inputWeightForm()]),
    );
  }

  Container inputAgeForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: ageController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.cake_rounded),
          labelText: 'Age',
          hintText: 'Enter your age',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your age';
          }
          if (int.tryParse(value!) == null) {
            return 'Please enter a valid age';
          }
          return null;
        },
        onSaved: (value) {
          _age = int.parse(value!);
        },
        onChanged: (value) {
          setState(() {
            _age = int.parse(value);
          });
        },
      ),
    );
  }

  Container inputWeightForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: weightController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.monitor_weight_rounded),
          labelText: 'Weight(kg)',
          hintText: 'Enter your weight in kg',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your weight';
          }
          if (double.tryParse(value!) == null) {
            return 'Please enter a valid weight';
          }
          return null;
        },
        onSaved: (value) {
          _weight = double.parse(value!); // 使用 '!' 運算符號
        },
      ),
    );
  }

  Container inputHeightForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: heightController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.emoji_people_rounded),
          labelText: 'Height(cm)',
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
          _height = double.parse(value!);
        },
      ),
    );
  }

  Container inputTrtbpsForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: trtbpsController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.emoji_people_rounded),
          labelText: 'resting blood pressure (in mm Hg)',
          hintText: 'Enter your resting blood pressure',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your resting blood pressure';
          }
          if (double.tryParse(value!) == null) {
            return 'Please enter a valid resting blood pressure';
          }
          return null;
        },
        onSaved: (value) {
          trtbps = double.parse(value!);
        },
      ),
    );
  }

  Container inputCholForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: cholController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.emoji_people_rounded),
          labelText: 'cholesterol in mg/dl fetched via BMI sensor',
          hintText: 'Enter your cholesterol',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your cholesterol';
          }
          if (double.tryParse(value!) == null) {
            return 'Please enter a valid cholesterol';
          }
          return null;
        },
        onSaved: (value) {
          chol = double.parse(value!);
        },
      ),
    );
  }

  Container inputThalachhForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: thalachhController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.emoji_people_rounded),
          labelText: 'maximum heart rate achieved',
          hintText: 'Enter your maximum heart rate',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your maximum heart rate';
          }
          if (double.tryParse(value!) == null) {
            return 'Please enter a valid maximum heart rate';
          }
          return null;
        },
        onSaved: (value) {
          thalachh = double.parse(value!);
        },
      ),
    );
  }

  Container inputOldpeakForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: oldpeakController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.emoji_people_rounded),
          labelText:
              'oldpeak = ST depression induced by exercise relative to rest',
          hintText: 'Enter your oldpeak',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your oldpeak';
          }
          if (double.tryParse(value!) == null) {
            return 'Please enter a valid oldpeak';
          }
          return null;
        },
        onSaved: (value) {
          oldpeak = double.parse(value!);
        },
      ),
    );
  }
}

Widget _buildRow(String label, Function onChanged) {
  var list = ['Yes', 'No'];
  if (label == 'Gender:') list = ['Female', "Male"];
  if (label == 'Chest Pain type chest pain type:')
    list = [
      'typical angina',
      'atypical angina',
      'non-anginal pain',
      'asymptomatic'
    ];
  if (label == "Slope:")
    list = [
      'upsloping',
      'flat',
      'downsloping',
    ];
  if (label == "Fasting blood sugar:")
    list = [
      'greater than 120mg/ml',
      'less than 120mg/ml',
    ];
  if (label == "Resting electrocardiographic results:")
    list = [
      'normal',
      'ST-T wave abnormality',
      'left ventricular hypertrophy',
    ];
  if (label == "Number of major vessels:" || label == "Thal rate:")
    list = ['0', '1', '2', '3'];
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
