import 'package:flutter/cupertino.dart';
import 'package:flutter_application/pages/main_page.dart';
import '../widgets/colors.dart';
import '../pages/login_page.dart';

class ExampleOption {
  String? name;
  String? desc;
  LinearGradient? color;

  ExampleOption({
    this.name,
    this.desc,
    this.color,
  });
}

List<ExampleOption> options_A = [
  ExampleOption(
    name: lang_map[lang]!['Cough'],
    desc: lang_map[lang]!['Cough desc'],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!['Fever'],
    desc: lang_map[lang]!['Fever desc'],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!['Sore Throat'],
    desc: lang_map[lang]!['Sore Throat desc'],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!['Shortness of Breath'],
    desc: lang_map[lang]!['Shortness of Breath desc'],
    color: gradientRed,
  ),
  ExampleOption(
    name: lang_map[lang]!['Headache'],
    desc: lang_map[lang]!['Headache desc'],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!['Age 60 and Above'],
    desc: lang_map[lang]!['Age 60 and Above desc'],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!['Gender'],
    desc: lang_map[lang]!['Gender desc'],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!['Test Indication'],
    desc: lang_map[lang]!['Test Indication desc'],
    color: gradientBlue,
  ),
];

List<ExampleOption> options_B = [
  ExampleOption(
    name: "Gender",
    desc: "Male or Female",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Polyuria",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Polydipsia",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Sudden Weight Loss",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Weakness",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Polyphagia",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Genital Thrush",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Visual Blurring",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Itching",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Irritability",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Delayed Healing",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Partial Paresis",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Muscle Stiffness",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Alopecia",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Obesity",
    desc: "undefined",
    color: gradientBlue,
  ),
];

List<ExampleOption> options_C = [
  ExampleOption(name: "Gender", desc: "undefined", color: gradientPurple),
  ExampleOption(
    name: "Smoking",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Alochol Drinking",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Stroke",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Difficulty Walking",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Diabetic",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Physical Activity",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(name: "Asthma", desc: "undefined", color: gradientPink),
  ExampleOption(
    name: "Kidney Disease",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(name: "Skin Cancer", desc: "undefined", color: gradientPurple),
];

List<ExampleOption> options_D = [
  ExampleOption(
    name: "Gender",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
    name: "Smoking",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Yellow Fingers",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(name: "Anxiety", desc: "undefined", color: gradientPink),
  ExampleOption(
    name: "Peer Pressure",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
      name: "Chronic disease", desc: "undefined", color: gradientPurple),
  ExampleOption(name: "Fatigue", desc: "undefined", color: gradientPink),
  ExampleOption(name: "Allergy", desc: "undefined", color: gradientBlue),
  ExampleOption(
    name: "Wheezing",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(
      name: "Alcohol Consuming", desc: "undefined", color: gradientPink),
  ExampleOption(
    name: "Coughing",
    desc: "undefined",
    color: gradientPink,
  ),
  ExampleOption(
    name: "Shortness of Breath",
    desc: "undefined",
    color: gradientBlue,
  ),
  ExampleOption(
    name: "Swallowing Difficulty",
    desc: "undefined",
    color: gradientPurple,
  ),
  ExampleOption(name: "Chest Pain", desc: "undefined", color: gradientPurple),
];
