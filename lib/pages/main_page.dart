import '../helper/helper_functions.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import '../services/auth_service.dart';
import '../helper/function.dart';
import '../form/dropdown.dart';
import '../form/example_buttons.dart';
import '../form/example_card.dart';
import '../data/restore_data.dart';
import '../data/url.dart';
import '../widgets/colors.dart';
import 'login_page.dart';
import '../widgets/animatedList.dart';

import '../languages/en_US.dart';
import '../languages/zh_TW.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:animation_list/animation_list.dart';
import 'package:flutter_application/form/options.dart';
import 'package:flutter_application/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:im_stepper/stepper.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:star_menu/star_menu.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

bool _loading_output = false;
bool _submit = false;
int _age = 0;
double _bmi = 0;
double _height = 0;
double _weight = 0;

Map<String, Map<String, dynamic>> lang_map = {
  "ZH": jsonDecode(data_ZH),
  "EN": jsonDecode(data_US)
};

class _MainPageState extends State<MainPage> {
  String userName = "";
  String email = "";
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
          title: Text(
            lang_map[lang]!["title"],
          ),
          backgroundColor: Colors.blue,
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.local_hospital),
                  selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  title: Text(
                    lang_map[lang]!["Disease Prediction"],
                    style: const TextStyle(color: Colors.black),
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
                  title: Text(
                    lang_map[lang]!["Profile"],
                    style: TextStyle(color: Colors.black),
                  )),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(
                  lang_map[lang]!["Language"],
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                            title: Text(lang_map[lang]!["Language"]),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        lang = "EN";
                                      });
                                      Navigator.pop(context);
                                    },
                                    leading: const Icon(Icons.language),
                                    title: Text(lang_map[lang]!["EN"]),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      setState(() {
                                        lang = "ZH";
                                      });
                                      Navigator.pop(context);
                                    },
                                    leading: const Icon(Icons.language),
                                    title: Text(lang_map[lang]!["ZH"]),
                                  ),
                                ],
                              ),
                            ));
                      }));
                },
              ),
              ListTile(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(lang_map[lang]!["Log Out"]),
                            content: Text(lang_map[lang]!["Check for Logout"]),
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
                  title: Text(
                    lang_map[lang]!["Log Out"],
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
  String output = '0';
  int activeStep = 0;
  String _selectedField = "Prediction";
  int _subStep = 0;
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
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              if (_selectedField == "Prediction")
                                DelayedWidget(
                                  animationDuration:
                                      Duration(microseconds: 500),
                                  delayDuration: Duration(microseconds: 300),
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            TapToExpand(
                                              content: Column(
                                                children: <Widget>[
                                                  Text(
                                                    lang_map[lang]![
                                                        "Description A"],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _selectedField =
                                                            "Prediction A";
                                                        activeStep = 1;
                                                        _submit = false;
                                                      });
                                                    },
                                                    child: Text(lang_map[lang]![
                                                        "Go to Prediction"]),
                                                  ),
                                                ],
                                              ),
                                              title: Text(
                                                lang_map[lang]!["Prediction A"],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              onTapPadding: 10,
                                              closedHeight: 70,
                                              scrollable: true,
                                              borderRadius: 10,
                                              openedHeight: 250,
                                            ),
                                            TapToExpand(
                                              content: Column(
                                                children: <Widget>[
                                                  Text(
                                                    lang_map[lang]![
                                                        "Description B"],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _selectedField =
                                                            "Prediction B";
                                                        activeStep = 1;
                                                        _subStep = 1;
                                                        _selectedGender = true;
                                                      });
                                                    },
                                                    child: Text(lang_map[lang]![
                                                        "Go to Prediction"]),
                                                  ),
                                                ],
                                              ),
                                              title: Text(
                                                lang_map[lang]!["Prediction B"],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              onTapPadding: 10,
                                              closedHeight: 70,
                                              scrollable: true,
                                              borderRadius: 10,
                                              openedHeight: 300,
                                            ),
                                            TapToExpand(
                                              content: Column(
                                                children: <Widget>[
                                                  Text(
                                                    lang_map[lang]![
                                                        "Description C"],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _selectedField =
                                                            "Prediction C";
                                                        activeStep = 1;
                                                        _subStep = 1;
                                                        _selectedGender = true;
                                                      });
                                                    },
                                                    child: Text(lang_map[lang]![
                                                        "Go to Prediction"]),
                                                  ),
                                                ],
                                              ),
                                              title: Text(
                                                lang_map[lang]!["Prediction C"],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              onTapPadding: 10,
                                              closedHeight: 70,
                                              scrollable: true,
                                              borderRadius: 10,
                                              openedHeight: 280,
                                            ),
                                            TapToExpand(
                                              content: Column(
                                                children: <Widget>[
                                                  Text(
                                                    lang_map[lang]![
                                                        "Description D"],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _selectedField =
                                                            "Prediction D";
                                                        activeStep = 1;
                                                        _subStep = 1;
                                                        _selectedGender = true;
                                                      });
                                                    },
                                                    child: Text(lang_map[lang]![
                                                        "Go to Prediction"]),
                                                  ),
                                                ],
                                              ),
                                              title: Text(
                                                lang_map[lang]!["Prediction D"],
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
                                ),
                              if (_selectedField == "Prediction A" &&
                                  _submit == false)
                                CupertinoPageScaffold(
                                  child: DelayedWidget(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                                              } else if (direction.name ==
                                                  "right") {
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
                                                _submit = true;
                                              });
                                            },
                                            cardsCount: options_A.length,
                                            cardsBuilder: (BuildContext context,
                                                int index) {
                                              return ExampleCard(
                                                  candidate: options_A[index]);
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                ),
                              if (_selectedField == "Prediction A" &&
                                  _submit == true)
                                Container(
                                  height: 500,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: AnimationList(
                                      children: prediction_A_data.map((item) {
                                    return buildTile_A(
                                        item['title'], item['index']);
                                  }).toList()),
                                ),
                              if (_selectedField == "Prediction B" &&
                                  _subStep == 1)
                                Column(children: [
                                  inputAgeForm(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState!.save();
                                        setState(() {
                                          _subStep = 2;
                                        });
                                      }
                                    },
                                    child: Text(lang_map[lang]!["Next Step"]),
                                  )
                                ]),
                              if (_selectedField == "Prediction B" &&
                                  _subStep == 2)
                                Container(
                                    child: Column(
                                  children: [
                                    if (_submit == false)
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                            } else if (direction.name ==
                                                "right") {
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
                                              _submit = true;
                                            });
                                          },
                                          cardsCount: options_B.length,
                                          cardsBuilder: (BuildContext context,
                                              int index) {
                                            return ExampleCard(
                                                candidate: options_B[index]);
                                          },
                                        ),
                                      ),
                                    if (_submit == false)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                              if (_selectedField == "Prediction B" &&
                                  _submit == true)
                                Container(
                                  height: 500,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: AnimationList(
                                      children: prediction_B_data.map((item) {
                                    return buildTile_B(
                                        item['title'], item['index']);
                                  }).toList()),
                                ),
                              if (_selectedField == "Prediction C" &&
                                  _subStep == 1)
                                Column(children: [
                                  inputAgeForm(),
                                  inputHeightForm(),
                                  inputWeightForm(),
                                  inputSleepTimeForm(),
                                  inputPhysicalHealthForm(),
                                  inputMentalHealthForm(),
                                  buildRow(
                                    "General Health:",
                                    (val) {
                                      setState(() {
                                        prediction_C[12] = val;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState!.save();
                                        setState(() {
                                          _subStep = 2;
                                        });
                                      }
                                    },
                                    child: Text(lang_map[lang]!["Next Step"]),
                                  )
                                ]),
                              if (_selectedField == "Prediction C" &&
                                  _subStep == 2)
                                Container(
                                    child: Column(
                                  children: [
                                    if (_submit == false)
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                              prediction_C[8] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 2) {
                                              prediction_C[2] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 3) {
                                              prediction_C[3] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 4) {
                                              prediction_C[4] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 5) {
                                              prediction_C[7] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 6) {
                                              prediction_C[10] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 7) {
                                              prediction_C[11] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 8) {
                                              prediction_C[14] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 9) {
                                              prediction_C[15] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
                                            } else if (index == 10) {
                                              prediction_C[16] =
                                                  direction.name == "left"
                                                      ? "0"
                                                      : "1";
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
                                              _submit = true;
                                            });
                                          },
                                          cardsCount: options_C.length,
                                          cardsBuilder: (BuildContext context,
                                              int index) {
                                            return ExampleCard(
                                                candidate: options_C[index]);
                                          },
                                        ),
                                      ),
                                    if (_submit == false)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                              if (_selectedField == "Prediction C" &&
                                  _submit == true)
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 500,
                                  child: AnimationList(
                                      children: prediction_C_data.map((item) {
                                    return buildTile_C(
                                        item['title'], item['index']);
                                  }).toList()),
                                ),
                              if (_selectedField == "Prediction D" &&
                                  _subStep == 1)
                                Column(children: [
                                  inputAgeForm(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState!.save();
                                        setState(() {
                                          _subStep = 2;
                                        });
                                      }
                                    },
                                    child: Text(lang_map[lang]!["Next Step"]),
                                  )
                                ]),
                              if (_selectedField == "Prediction D" &&
                                  _subStep == 2)
                                Column(
                                  children: [
                                    if (_submit == false)
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                            } else if (direction.name ==
                                                    "left" &&
                                                index > 1) {
                                              prediction_D[index + 1] = "1";
                                            } else if (direction.name ==
                                                "right") {
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
                                              _submit = true;
                                            });
                                          },
                                          cardsCount: options_D.length,
                                          cardsBuilder: (BuildContext context,
                                              int index) {
                                            return ExampleCard(
                                                candidate: options_D[index]);
                                          },
                                        ),
                                      ),
                                    if (_submit == false)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                              if (_selectedField == "Prediction D" &&
                                  _submit == true)
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 500,
                                  child: AnimationList(
                                      children: prediction_D_data.map((item) {
                                    return buildTile_D(
                                        item['title'], item['index']);
                                  }).toList()),
                                ),
                              SizedBox(height: 16.0),
                              if ((_selectedField == "Prediction A" ||
                                      _selectedField == "Prediction B" ||
                                      _selectedField == "Prediction C" ||
                                      _selectedField == "Prediction D") &&
                                  _submit == true)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_selectedField == "Prediction A") {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            _formKey.currentState!.save();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(lang_map[lang]![
                                                    "Data Submitted"]),
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                            _submitPredictionA(url_A);
                                          }
                                        } else if (_selectedField ==
                                            "Prediction B") {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            _formKey.currentState!.save();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(lang_map[lang]![
                                                    "Data Submitted"]),
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                            _submitPredictionB(url_B);
                                          }
                                        } else if (_selectedField ==
                                            "Prediction C") {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            _formKey.currentState!.save();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(lang_map[lang]![
                                                    "Data Submitted"]),
                                                duration: Duration(seconds: 1),
                                              ),
                                            );

                                            _submitPredictionC(url_C);
                                            //print(prediction_C);
                                          }
                                        } else if (_selectedField ==
                                            "Prediction D") {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            _formKey.currentState!.save();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(lang_map[lang]![
                                                    "Data Submitted"]),
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                            _submitPredictionD(url_D);
                                          }
                                        }
                                      },
                                      child: Text(
                                          lang_map[lang]!["Submit Form"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (_selectedField == "Prediction A" ||
                                  _selectedField == "Prediction B" ||
                                  _selectedField == "Prediction C" ||
                                  _selectedField == "Prediction D")
                                ElevatedButton(
                                  onPressed: () {
                                    initial_state();
                                  },
                                  child: Text(lang_map[lang]!["Return to Menu"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              if (activeStep == 2)
                                Container(
                                  child: Column(
                                    children: [
                                      _loading_output
                                          ? LoadingAnimationWidget
                                              .staggeredDotsWave(
                                              color: Colors.black,
                                              size: 200,
                                            )
                                          : DelayedWidget(
                                              child: CircularPercentIndicator(
                                                radius: 160.0,
                                                lineWidth: 30.0,
                                                animationDuration: 100,
                                                linearGradient: gradientRed,
                                                percent:
                                                    double.parse(output) * 0.01,
                                                center: Text(
                                                    "Prediction $output %"),
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          initial_state();
                                        },
                                        child: Text(
                                          lang_map[lang]!["Return to Menu"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ]))))));
  }

  Future<void> _submitPredictionA(String url) async {
    _loading_output = true;
    List<String> _titles_A = [
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
      _newRecord += "${_titles_A[i]}:${prediction_A[i]}_";
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
    debugPrint(url);
    setState(() {
      output = decoded['output'];
      _loading_output = false;
    });
    _newRecord = _newRecord.substring(0, _newRecord.length - 1);
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .updateRecords(_newRecord);
    //_showResult("Probability of Covid :", output);
  }

//https://early-stage-diabetes-risk-prediction.onrender.com/api?Age=20&Gender=0&Polyuria=0&Polydipsia=0&sudden_weight_loss=0&weakness=0&Polyphagia=0&Genital_thrush=0&visual_blurring=0&Itching=0&Irritability=0&delayed_healing=0&partial_paresis=0&muscle_stiffness=0&Alopecia=0&Obesity=0
  Future<void> _submitPredictionB(String url) async {
    _loading_output = true;
    setState(() {
      _selectedField = "Result B";
      activeStep = 2;
    });

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
    debugPrint(url);
    setState(() {
      output = decoded['output'];
      _loading_output = false;
    });
  }

  // https://personal-key-indicators-of-heart-disease.onrender.com/api?BMI=16.6&Smoking=1&AlcoholDrinking=0&Stroke=0&PhysicalHealth=3&MentalHealth=30&DiffWalking=0&Sex=0&AgeCategory=7&Diabetic=1&PhysicalActivity=1&GenHealth=3&SleepTime=5&Asthma=1&KidneyDisease=0&SkinCancer=1
  Future<void> _submitPredictionC(String url) async {
    _loading_output = true;
    setState(() {
      _selectedField = "Result C";
      activeStep = 2;
    });
    _calculateBMI();
    url += 'BMI=';
    url += prediction_C[1];
    url += '&Smoking=';
    url += prediction_C[2];
    url += '&AlcoholDrinking=';
    url += prediction_C[3];
    url += '&Stroke=';
    url += prediction_C[4];
    url += '&PhysicalHealth=';
    url += prediction_C[5];
    url += '&MentalHealth=';
    url += prediction_C[6];
    url += '&Diff =';
    url += prediction_C[7];
    url += '&Sex=';
    url += prediction_C[8];
    url += '&AgeCategory=';
    url += prediction_C[9];
    url += '&Diabetic=';
    url += prediction_C[10];
    url += '&PhysicalActivity=';
    url += prediction_C[11];
    url += '&GenHealth=';
    url += prediction_C[12];
    url += '&SleepTime=';
    url += prediction_C[13];
    url += '&Asthma=';
    url += prediction_C[14];
    url += '&KidneyDisease=';
    url += prediction_C[15];
    url += '&SkinCancer=';
    url += prediction_C[16];
    var data = await fetchData(url);
    var decoded = await jsonDecode(data);
    debugPrint(url);
    setState(() {
      output = decoded['output'];
      _loading_output = false;
    });
  }

  // https://lung-cancer-808h.onrender.com/api?GENDER=1&AGE=50&SMOKING=2&YELLOW_FINGERS=1&ANXIETY=1&PEER_PRESSURE=1&CHRONIC_DISEASE=1&FATIGUE=2&ALLERGY=2&WHEEZING=1&ALCOHOL_CONSUMING=2&COUGHING=2&SHORTNESS_OF_BREATH=1&SWALLOWING_DIFFICULTY=1&CHEST_PAIN=1
  Future<void> _submitPredictionD(String url) async {
    _loading_output = true;
    setState(() {
      _selectedField = "Result D";
      activeStep = 2;
    });
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
    debugPrint(url);
    var data = await fetchData(url);
    var decoded = await jsonDecode(data);
    //print(url);
    setState(() {
      output = decoded['output'];
      _loading_output = false;
    });
    //_showResult("Probability of Lung Cancer:", output);
  }

  String _calculateAgeCategory(int age) {
    age -= 25;
    age = age ~/ 5;
    if (age < 0) age = 0;
    if (age > 12) age = 12;
    return age.toString();
  }

  void _calculateBMI() {
    double heightInMeters = _height / 100;
    _bmi = _weight / (heightInMeters * heightInMeters);
    prediction_C[1] = _bmi.toStringAsFixed(1);
  }

  Container inputAgeForm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autofocus: true,
        controller: ageController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.cake_rounded),
          labelText: lang_map[lang]!["Age"],
          hintText: lang_map[lang]!["Enter your Age"],
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return lang_map[lang]!["Enter your Age"];
          }
          if (int.tryParse(value!) == null) {
            return lang_map[lang]!["Enter a valid Age"];
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
            prediction_C[9] = _calculateAgeCategory(int.parse(value));
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
          _weight = double.parse(value!);
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
            return 'Please enter your height';
          }
          if (double.tryParse(value!) == null) {
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
              int.parse(value) > 31 ||
              int.parse(value) < 0) {
            return 'Please enter in range 0 to 31';
          }
          return null;
        },
        onSaved: (value) {
          prediction_C[6] = int.parse(value!).toString();
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
          labelText: 'physical health',
          hintText: 'Illness or injury last month.',
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter your physical health';
          }
          if (int.tryParse(value!) == null ||
              int.parse(value) > 31 ||
              int.parse(value) < 0) {
            return 'Please enter in range 0 to 31';
          }
          return null;
        },
        onSaved: (value) {
          prediction_C[5] = int.parse(value!).toString();
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
          if (double.parse(value) > 24 || double.parse(value) < 0) {
            return 'Please enter 0 to 24';
          }
          return null;
        },
        onSaved: (value) {
          prediction_C[13] = value!;
        },
      ),
    );
  }

  void initial_state() {
    setState(() {
      _selectedField = "Prediction";
      _submit = false;
      activeStep = 0;
      _subStep = 0;
      _selectedGender = false;
    });
  }
}
