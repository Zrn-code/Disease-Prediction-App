import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/form/options.dart';
import 'package:flutter_application/pages/profile_page.dart';
import '../helper/helper_functions.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import '../services/auth_service.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../helper/function.dart';
import '../form/dropdown.dart';
import 'package:im_stepper/stepper.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import '../form/example_buttons.dart';
import '../form/example_card.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

String gender = "1";
String BMI = "1";
String Smoking = "1";
String AlcoholDrinking = "1";
String Stroke = "1";
String PhysicalHealth = "1";
String MentalHealth = "1";
String DiffWalking = "1";
String AgeCategory = "1";
String Diabetic = "1";
String PhysicalActivity = "1";
String GenHealth = "1";
String SleepTime = "1";
String Asthma = "1";
String KidneyDisease = "1";
String SkinCancer = "1";

List<String> prediction_A = [
  "undefined",
  "0", // Cough
  "0", // Fever
  "0", // Sore Throat
  "0", // Shortness of Breath
  "0", // Headache
  "0", // Age 60 and Above
  "0", // Gender
  "0" // Test Indication
];
List<String> prediction_B = [
  "20", // Age
  "0", // Gender
  "0", // Polyuria
  "0", // Polydipsia
  "0", // Sudden Weight Loss
  "0", // Weakness
  "0", // Polyphagia
  "0", // Genital Thrush
  "0", // Visual Blurring
  "0", // Itching
  "0", // Irritability
  "0", // Delayed Healing
  "0", // Partial Paresis
  "0", // Muscle Stiffness
  "0", // Alopecia
  "0", // Obesity
];

List<String> prediction_C = [
  "undefined",
  "0", // BMI
  "0", // Smoking
  "0", // Alcohol Drinking
  "0", // Stroke
  "0", // Physical Health
  "0", // Mental Health
  "0", // Difficult Walking
  "0", // Age Category
  "0", // Diabetic
  "0", // Physical Activity
  "0", // General Health
  "0", // Sleep Time
  "0", // Asthma
  "0", // Kidney Disease
  "0", // Skin Cancer
];
List<String> prediction_D = [
  "undefiend",
  "0", // Gender
  "30", // Age
  "0", // Smoking
  "0", // Yellow Fingers
  "0", // Anxiety
  "0", // Peer Pressure
  "0", // Chronic Disease
  "0", // Fatigue
  "0", // Allergy
  "0", // Wheezing
  "0", // Alcohol Consuming
  "0", // Coughing
  "0", // Shortness of Breath
  "0", // Swallowing Difficulty
  "0", // Chest Pain
];
bool _loading_output = false;
bool _submit = false;
String _selectedValue = "Prediction";
String url_A = 'https://flask-app-test-yqkj.onrender.com/api?';
String url_B = 'https://early-stage-diabetes-risk-prediction.onrender.com/api?';
// https://personal-key-indicators-of-heart-disease.onrender.com/api?BMI=16.6&Smoking=1&AlcoholDrinking=0&Stroke=0&PhysicalHealth=3&MentalHealth=30&DiffWalking=0&Sex=0&AgeCategory=7&Diabetic=1&PhysicalActivity=1&GenHealth=3&SleepTime=5&Asthma=1&KidneyDisease=0&SkinCancer=1
String url_C =
    'https://personal-key-indicators-of-heart-disease.onrender.com/api?';
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
                                                const LoginScreen()),
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
  String output = 'Prediction';
  int activeStep = 0;
  String _selectedField = "Prediction";
  String current_prediction = "X";
  bool _selectedGender = false;
  final AppinioSwiperController controller = AppinioSwiperController();
  AuthService authService = AuthService();

  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController trtbpsController = TextEditingController();
  TextEditingController cholController = TextEditingController();
  TextEditingController thalachhController = TextEditingController();
  TextEditingController oldpeakController = TextEditingController();
  TextEditingController physicalhealthController = TextEditingController();
  TextEditingController mentalHealthController = TextEditingController();
  TextEditingController sleepTimeController = TextEditingController();
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
                          NumberStepper(
                            numbers: [1, 2, 3],
                            activeStep: activeStep,
                            activeStepColor: Colors.blue,
                            stepColor: Colors.grey,
                            numberStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            onStepReached: (index) {
                              setState(() {
                                if (index == 0) {
                                  activeStep = 0;
                                  _selectedField = "Prediction";
                                  _selectedGender = false;
                                } else if (index == 1 && activeStep == 0) {
                                  activeStep = 0;
                                  _selectedField = "Prediction";
                                  _selectedGender = false;
                                }
                              });
                            },
                          ),
                          if (_selectedField == "Prediction")
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      TapToExpand(
                                        content: Row(
                                          children: <Widget>[
                                            Text("hello"),
                                            Expanded(child: Container()),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _selectedField =
                                                      "Prediction A";
                                                  activeStep = 1;
                                                  _submit = false;
                                                  current_prediction = "A";
                                                });
                                              },
                                              child: Text('Go to Prediction'),
                                            ),
                                          ],
                                        ),
                                        title: const Text(
                                          'Covid Prediction',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        onTapPadding: 10,
                                        closedHeight: 70,
                                        scrollable: true,
                                        borderRadius: 10,
                                        openedHeight: 200,
                                      ),
                                      TapToExpand(
                                        content: Row(
                                          children: <Widget>[
                                            Text("hello"),
                                            Expanded(child: Container()),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedField =
                                                      "Prediction B";
                                                  activeStep = 1;
                                                  _selectedGender = true;
                                                  current_prediction = "B";
                                                });
                                              },
                                              child: Text('Go to Prediction'),
                                            ),
                                          ],
                                        ),
                                        title: const Text(
                                          'Diabetes mellitus',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        onTapPadding: 10,
                                        closedHeight: 70,
                                        scrollable: true,
                                        borderRadius: 10,
                                        openedHeight: 200,
                                      ),
                                      TapToExpand(
                                        content: Row(
                                          children: <Widget>[
                                            Text("hello"),
                                            Expanded(child: Container()),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedField =
                                                      "Prediction C";
                                                  activeStep = 1;
                                                  current_prediction = "C";
                                                });
                                              },
                                              child: Text('Go to Prediction'),
                                            ),
                                          ],
                                        ),
                                        title: const Text(
                                          'Heart Disease',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        onTapPadding: 10,
                                        closedHeight: 70,
                                        scrollable: true,
                                        borderRadius: 10,
                                        openedHeight: 200,
                                      ),
                                      TapToExpand(
                                        content: Row(
                                          children: <Widget>[
                                            Text("hello"),
                                            Expanded(child: Container()),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedField =
                                                      "Prediction D";
                                                  activeStep = 1;
                                                  current_prediction = "D";
                                                  _selectedGender = true;
                                                });
                                              },
                                              child: Text('Go to Prediction'),
                                            ),
                                          ],
                                        ),
                                        title: const Text(
                                          'Lung Cancer',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        onTapPadding: 10,
                                        closedHeight: 70,
                                        scrollable: true,
                                        borderRadius: 10,
                                        openedHeight: 200,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (_selectedField == "Prediction A" &&
                              _submit == false)
                            CupertinoPageScaffold(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: AppinioSwiper(
                                      swipeOptions:
                                          AppinioSwipeOptions.vertical,
                                      unlimitedUnswipe: true,
                                      controller: controller,
                                      isDisabled: true,
                                      onSwipe: ((index, direction) {
                                        setState(() {
                                          _selectedGender = (index == 6);
                                        });
                                        if (direction.name == "left") {
                                          prediction_A[index] = "0";
                                        } else if (direction.name == "right") {
                                          prediction_A[index] = "1";
                                        }
                                      }),
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 50,
                                        bottom: 40,
                                      ),
                                      onEnd: () {
                                        setState(() {
                                          print(prediction_A);
                                          _submit = true;
                                        });
                                      },
                                      cardsCount: options_A.length,
                                      cardsBuilder:
                                          (BuildContext context, int index) {
                                        return ExampleCard(
                                            candidate: options_A[index]);
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      _selectedGender
                                          ? selectFemaleButton(controller)
                                          : swipeLeftButton(controller),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      _selectedGender
                                          ? selectMaleButton(controller)
                                          : swipeRightButton(controller),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      unswipeButton(controller),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          if (_selectedField == "Prediction B")
                            Container(
                                child: Column(
                              children: [
                                inputAgeForm(),
                                if (_submit == false)
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: AppinioSwiper(
                                      swipeOptions:
                                          AppinioSwipeOptions.vertical,
                                      unlimitedUnswipe: true,
                                      controller: controller,
                                      isDisabled: true,
                                      onSwipe: ((index, direction) {
                                        setState(() {
                                          _selectedGender = false;
                                        });
                                        if (direction.name == "left") {
                                          prediction_B[index] = "0";
                                        } else if (direction.name == "right") {
                                          prediction_B[index] = "1";
                                        }
                                      }),
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 50,
                                        bottom: 40,
                                      ),
                                      onEnd: () {
                                        setState(() {
                                          print(prediction_B);
                                          _submit = true;
                                        });
                                      },
                                      cardsCount: options_B.length,
                                      cardsBuilder:
                                          (BuildContext context, int index) {
                                        return ExampleCard(
                                            candidate: options_B[index]);
                                      },
                                    ),
                                  ),
                                if (_submit == false)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      _selectedGender
                                          ? selectFemaleButton(controller)
                                          : swipeLeftButton(controller),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      _selectedGender
                                          ? selectMaleButton(controller)
                                          : swipeRightButton(controller),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      unswipeButton(controller),
                                    ],
                                  )
                              ],
                            )),
                          if (_selectedField == "Prediction C")
                            prediction_C_Form(),
                          if (_selectedField == "Prediction D")
                            Column(
                              children: [
                                inputAgeForm(),
                                if (_submit == false)
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: AppinioSwiper(
                                      swipeOptions:
                                          AppinioSwipeOptions.vertical,
                                      unlimitedUnswipe: true,
                                      controller: controller,
                                      isDisabled: true,
                                      onSwipe: ((index, direction) {
                                        setState(() {
                                          _selectedGender = false;
                                        });
                                        if (index == 1) {
                                          if (direction.name == "left") {
                                            prediction_D[index] = "0";
                                          } else if (direction.name ==
                                              "right") {
                                            prediction_D[index] = "1";
                                          }
                                        } else if (direction.name == "left" &&
                                            index > 1) {
                                          prediction_D[index + 1] = "1";
                                        } else if (direction.name == "right") {
                                          prediction_D[index + 1] = "2";
                                        }
                                      }),
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 50,
                                        bottom: 40,
                                      ),
                                      onEnd: () {
                                        setState(() {
                                          print(prediction_D);
                                          _submit = true;
                                        });
                                      },
                                      cardsCount: options_D.length,
                                      cardsBuilder:
                                          (BuildContext context, int index) {
                                        return ExampleCard(
                                            candidate: options_D[index]);
                                      },
                                    ),
                                  ),
                                if (_submit == false)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      _selectedGender
                                          ? selectFemaleButton(controller)
                                          : swipeLeftButton(controller),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      _selectedGender
                                          ? selectMaleButton(controller)
                                          : swipeRightButton(controller),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      unswipeButton(controller),
                                    ],
                                  )
                              ],
                            ),
                          SizedBox(height: 16.0),
                          if ((_selectedField == "Prediction A" ||
                                  _selectedField == "Prediction B" ||
                                  _selectedField == "Prediction C" ||
                                  _selectedField == "Prediction D") &&
                              _submit == true)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_selectedField == "Prediction A") {
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
                                    } else if (_selectedField ==
                                        "Prediction D") {
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
                                        _submitPredictionD(url_D);
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
                          if (_selectedField == "Prediction A" ||
                              _selectedField == "Prediction B" ||
                              _selectedField == "Prediction C" ||
                              _selectedField == "Prediction D")
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_selectedField == "Prediction A" ||
                                        _selectedField == "Prediction B" ||
                                        _selectedField == "Prediction C" ||
                                        _selectedField == "Prediction D") {
                                      setState(() {
                                        _selectedField = "Prediction";
                                        _submit = false;
                                        activeStep = 0;
                                        _selectedGender = false;
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
                          if (activeStep == 2)
                            Container(
                              child: Column(
                                children: [
                                  if (_loading_output == false)
                                    Text("Result: " + output),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        activeStep = 0;
                                        _selectedField = "Prediction";
                                        output = "Prediction";
                                      });
                                    },
                                    child: Text(
                                      "Return To Menu".toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )
                        ])))));
  }

  Future<void> _submitPredictionA(String url) async {
    _loading_output = true;
    List<String> _titles = [
      "undefined",
      "cough",
      "fever",
      "sore throat",
      "shortness of breath",
      "head ache",
      "age 60 and above",
      "gender",
      "test indication"
    ];
    String _newRecord = "Covid19:";
    _newRecord +=
        "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}_";

    for (int i = 1; i <= 8; i++) {
      _newRecord += "${_titles[i]}:${prediction_A[i]}_";
    }
    debugPrint(_newRecord);
    setState(() {
      _selectedField = "Result A";
      activeStep = 2;
    });

    url += 'cough=';
    url += prediction_A[1];
    url += '&fever=';
    url += prediction_A[2];
    url += '&sore_throat=';
    url += prediction_A[3];
    url += '&shortness_of_breath=';
    url += prediction_A[4];
    url += '&head_ache=';
    url += prediction_A[5];
    url += '&age_60_and_above=';
    url += prediction_A[6];
    url += '&gender=';
    url += prediction_A[7];
    url += '&test_indication=';
    url += prediction_A[8];
    var data = await fetchData(url);
    var decoded = await jsonDecode(data);
    print(url);
    setState(() {
      output = decoded['output'];
    });
    _newRecord = _newRecord.substring(0, _newRecord.length - 1);
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .updateRecords(_newRecord);
    //_showResult("Probability of Covid :", output);
    _loading_output = false;
  }

//https://early-stage-diabetes-risk-prediction.onrender.com/api?Age=20&Gender=0&Polyuria=0&Polydipsia=0&sudden_weight_loss=0&weakness=0&Polyphagia=0&Genital_thrush=0&visual_blurring=0&Itching=0&Irritability=0&delayed_healing=0&partial_paresis=0&muscle_stiffness=0&Alopecia=0&Obesity=0
  Future<void> _submitPredictionB(String url) async {
    url += 'Age=';
    url += prediction_B[0];
    url += '&Gender=';
    url += prediction_B[1];
    url += '&Polyuria=';
    url += prediction_B[2];
    url += '&Polydipsia=';
    url += prediction_B[3];
    url += '&sudden_weight_loss=';
    url += prediction_B[4];
    url += '&weakness=';
    url += prediction_B[5];
    url += '&Polyphagia=';
    url += prediction_B[6];
    url += '&Genital_thrush=';
    url += prediction_B[7];
    url += '&visual_blurring=';
    url += prediction_B[8];
    url += '&Itching=';
    url += prediction_B[9];
    url += '&Irritability=';
    url += prediction_B[10];
    url += '&delayed_healing=';
    url += prediction_B[11];
    url += '&partial_paresis=';
    url += prediction_B[12];
    url += '&muscle_stiffness=';
    url += prediction_B[13];
    url += '&Alopecia=';
    url += prediction_B[14];
    url += '&Obesity=';
    url += prediction_B[15];
    var data = await fetchData(url);
    var decoded = await jsonDecode(data);
    print(url);
    setState(() {
      output = decoded['output'];
    });
    _showResult("Probability of Diabetes mellitus:", output);
  }

  // https://personal-key-indicators-of-heart-disease.onrender.com/api?BMI=16.6&Smoking=1&AlcoholDrinking=0&Stroke=0&PhysicalHealth=3&MentalHealth=30&DiffWalking=0&Sex=0&AgeCategory=7&Diabetic=1&PhysicalActivity=1&GenHealth=3&SleepTime=5&Asthma=1&KidneyDisease=0&SkinCancer=1
  Future<void> _submitPredictionC(String url) async {
    _calculateBMI();
    _calculateAgeCategory();
    url += 'BMI=';
    url += _bmi.toString();
    url += '&Smoking=';
    url += Smoking;
    url += '&AlcoholDrinking=';
    url += AlcoholDrinking;
    url += '&Stroke=';
    url += Stroke;
    url += '&PhysicalHealth=';
    url += PhysicalHealth;
    url += '&MentalHealth=';
    url += MentalHealth;
    url += '&DiffWalking=';
    url += DiffWalking;
    url += '&Sex=';
    url += gender;
    url += '&AgeCategory=';
    url += AgeCategory;
    url += '&Diabetic=';
    url += Diabetic;
    url += '&PhysicalActivity=';
    url += PhysicalActivity;
    url += '&GenHealth=';
    url += GenHealth;
    url += '&SleepTime=';
    url += SleepTime;
    url += '&Asthma=';
    url += Asthma;
    url += '&KidneyDisease=';
    url += KidneyDisease;
    url += '&SkinCancer=';
    url += SkinCancer;
    var data = await fetchData(url);
    var decoded = await jsonDecode(data);
    print(url);
    setState(() {
      output = decoded['output'];
    });
    _showResult("Probability of Heart Disease:", output);
  }

  // https://lung-cancer-808h.onrender.com/api?GENDER=1&AGE=50&SMOKING=2&YELLOW_FINGERS=1&ANXIETY=1&PEER_PRESSURE=1&CHRONIC_DISEASE=1&FATIGUE=2&ALLERGY=2&WHEEZING=1&ALCOHOL_CONSUMING=2&COUGHING=2&SHORTNESS_OF_BREATH=1&SWALLOWING_DIFFICULTY=1&CHEST_PAIN=1
  Future<void> _submitPredictionD(String url) async {
    url += 'GENDER=';
    url += prediction_D[1];
    url += '&AGE=';
    url += prediction_D[2];
    url += '&SMOKING=';
    url += prediction_D[3];
    url += '&YELLOW_FINGERS=';
    url += prediction_D[4];
    url += '&ANXIETY=';
    url += prediction_D[5];
    url += '&PEER_PRESSURE=';
    url += prediction_D[6];
    url += '&CHRONIC_DISEASE=';
    url += prediction_D[7];
    url += '&FATIGUE=';
    url += prediction_D[8];
    url += '&ALLERGY=';
    url += prediction_D[9];
    url += '&WHEEZING=';
    url += prediction_D[10];
    url += '&ALCOHOL_CONSUMING=';
    url += prediction_C[11];
    url += '&COUGHING=';
    url += prediction_D[12];
    url += '&SHORTNESS_OF_BREATH=';
    url += prediction_D[13];
    url += '&SWALLOWING_DIFFICULTY=';
    url += prediction_D[14];
    url += '&CHEST_PAIN=';
    url += prediction_D[15];
    print(url);
    var data = await fetchData(url);
    var decoded = await jsonDecode(data);
    //print(url);
    setState(() {
      output = decoded['output'];
    });
    _showResult("Probability of Lung Cancer:", output);
  }

  void _submitFormBMI() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      _calculateBMI();
      _showResult("Your BMI is:", _bmi.toStringAsFixed(1));
    }
  }

  void _calculateAgeCategory() {
    if (_age < 25)
      AgeCategory = "0";
    else if (_age < 30)
      AgeCategory = "1";
    else if (_age < 35)
      AgeCategory = "2";
    else if (_age < 40)
      AgeCategory = "3";
    else if (_age < 45)
      AgeCategory = "4";
    else if (_age < 50)
      AgeCategory = "5";
    else if (_age < 55)
      AgeCategory = "6";
    else if (_age < 60)
      AgeCategory = "7";
    else if (_age < 65)
      AgeCategory = "8";
    else if (_age < 70)
      AgeCategory = "9";
    else if (_age < 75)
      AgeCategory = "10";
    else if (_age < 80)
      AgeCategory = "11";
    else
      AgeCategory = "12";
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

  // https://personal-key-indicators-of-heart-disease.onrender.com/api?BMI=16.6&Smoking=1&AlcoholDrinking=0&Stroke=0&PhysicalHealth=3&MentalHealth=30&DiffWalking=0&Sex=0&AgeCategory=7&Diabetic=1&PhysicalActivity=1&GenHealth=3&SleepTime=5&Asthma=1&KidneyDisease=0&SkinCancer=1
  Container prediction_C_Form() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputAgeForm(),
            inputHeightForm(),
            inputWeightForm(),
            inputSleepTimeForm(),
            inputPhysicalHealthForm(),
            inputMentalHealthForm(),
            _buildRow('smoking:', (value) {
              setState(() {
                Smoking = value;
              });
            }),
            _buildRow('Alcohol Drinking:', (value) {
              setState(() {
                AlcoholDrinking = value;
              });
            }),
            _buildRow('Stroke:', (value) {
              setState(() {
                Stroke = value;
              });
            }),
            _buildRow('Difficulty Walking:', (value) {
              setState(() {
                DiffWalking = value;
              });
            }),
            _buildRow('Diabetic:', (value) {
              setState(() {
                Diabetic = value;
              });
            }),
            _buildRow('Physical Activity during past 30 days:', (value) {
              setState(() {
                PhysicalActivity = value;
              });
            }),
            _buildRow('General Health:', (value) {
              setState(() {
                GenHealth = value;
              });
            }),
            _buildRow('Asthma:', (value) {
              setState(() {
                Asthma = value;
              });
            }),
            _buildRow('Kidney Disease:', (value) {
              setState(() {
                KidneyDisease = value;
              });
            }),
            _buildRow('Skin Cancer:', (value) {
              setState(() {
                SkinCancer = value;
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
            prediction_B[0] = _age.toString();
            prediction_D[2] = _age.toString();
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

  Container inputMentalHealthForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: mentalHealthController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.heart_broken_rounded),
          labelText: 'mental health',
          hintText: 'Bad feeling days last month.',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your mental health';
          }
          if (double.tryParse(value!) == null ||
              int.parse(value) > 30 ||
              int.parse(value) < 0) {
            return 'Please enter in range 0 to 30';
          }
          return null;
        },
        onSaved: (value) {
          MentalHealth = int.parse(value!).toString();
        },
      ),
    );
  }

  Container inputPhysicalHealthForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: physicalhealthController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.mood_bad_rounded),
          labelText: 'mental health',
          hintText: 'Illness or injury in 30 days.',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your physical health';
          }
          if (int.tryParse(value!) == null ||
              int.parse(value) > 30 ||
              int.parse(value) < 0) {
            return 'Please enter in range 0 to 30';
          }
          return null;
        },
        onSaved: (value) {
          PhysicalHealth = int.parse(value!).toString();
        },
      ),
    );
  }

  Container inputSleepTimeForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: sleepTimeController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.bedtime_rounded),
          labelText: 'sleep time',
          hintText: 'Enter your sleep time(in hours)',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your sleep time';
          }
          if (double.tryParse(value!) == null) {
            return 'Please enter a valid sleep time';
          }
          return null;
        },
        onSaved: (value) {
          SleepTime = value!;
        },
      ),
    );
  }
}

Widget _buildRow(String label, Function onChanged) {
  var list = ['Yes', 'No'];
  if (label == 'Gender:') list = ['Female', "Male"];
  if (label == 'Smoking:' ||
      label == 'Yellow Fingers:' ||
      label == 'Anxiety:' ||
      label == 'Peer Pressure:' ||
      label == 'Chronic Disease:' ||
      label == 'Fatigue:' ||
      label == 'Allergy:' ||
      label == 'Wheezing:' ||
      label == 'Alcohol Consuming:' ||
      label == 'Coughing:' ||
      label == 'Shortness of Breath:' ||
      label == 'Swallowing Difficulty:' ||
      label == 'Chest Pain:') list = ['YES', 'NO'];
  if (label == 'General Health:')
    list = [
      'Excellent',
      'Very Good',
      'Good',
      'Poor',
      'Fair',
    ];
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
