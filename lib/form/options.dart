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
    name: lang_map[lang]!["Gender"],
    desc: lang_map[lang]!["Gender desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Polyuria"],
    desc: lang_map[lang]!["Polyuria desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Polydipsia"],
    desc: lang_map[lang]!["Polydipsia desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Sudden Weight Loss"],
    desc: lang_map[lang]!["Sudden Weight Loss desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Weakness"],
    desc: lang_map[lang]!["Weakness desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Polyphagia"],
    desc: lang_map[lang]!["Polyphagia desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Genital Thrush"],
    desc: lang_map[lang]!["Genital Thrush desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Visual Blurring"],
    desc: lang_map[lang]!["Visual Blurring desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Itching"],
    desc: lang_map[lang]!["Itching desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Irritability"],
    desc: lang_map[lang]!["Irritability desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Delayed Healing"],
    desc: lang_map[lang]!["Delayed Healing desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Partial Paresis"],
    desc: lang_map[lang]!["Partial Paresis desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Muscle Stiffness"],
    desc: lang_map[lang]!["Muscle Stiffness desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Alopecia"],
    desc: lang_map[lang]!["Alopecia desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Obesity"],
    desc: lang_map[lang]!["Obesity desc"],
    color: gradientBlue,
  ),
];

List<ExampleOption> options_C = [
  ExampleOption(
      name: lang_map[lang]!["Gender"],
      desc: lang_map[lang]!["Gender desc"],
      color: gradientPurple),
  ExampleOption(
    name: lang_map[lang]!["Smoking"],
    desc: lang_map[lang]!["Smoking desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Alcohol Drinking"],
    desc: lang_map[lang]!["Alcohol Drinking desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Stroke"],
    desc: lang_map[lang]!["Stroke desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Walking Difficulty"],
    desc: lang_map[lang]!["Walking Difficulty desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Diabetic"],
    desc: lang_map[lang]!["Diabetic desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Physical Activity"],
    desc: lang_map[lang]!["Physical Activity desc"],
    color: gradientPink,
  ),
  ExampleOption(
      name: lang_map[lang]!["Asthma"],
      desc: lang_map[lang]!["Asthma desc"],
      color: gradientPink),
  ExampleOption(
    name: lang_map[lang]!["Kidney Disease"],
    desc: lang_map[lang]!["Kidney Disease desc"],
    color: gradientBlue,
  ),
  ExampleOption(
      name: lang_map[lang]!["Skin Cancer"],
      desc: lang_map[lang]!["Skin Cancer desc"],
      color: gradientPurple),
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
