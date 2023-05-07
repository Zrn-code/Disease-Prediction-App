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
    name: lang_map[lang]!["Gender"],
    desc: lang_map[lang]!["Gender desc"],
    color: gradientPurple,
  ),
  ExampleOption(
    name: lang_map[lang]!["Smoking"],
    desc: lang_map[lang]!["Smoking desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Yellow Fingers"],
    desc: lang_map[lang]!["Yellow Fingers desc"],
    color: gradientPurple,
  ),
  ExampleOption(
      name: lang_map[lang]!["Anxiety"],
      desc: lang_map[lang]!["Anxiety desc"],
      color: gradientPink),
  ExampleOption(
    name: lang_map[lang]!["Peer Pressure"],
    desc: lang_map[lang]!["Peer Pressure desc"],
    color: gradientBlue,
  ),
  ExampleOption(
      name: lang_map[lang]!["Chronic Disease"],
      desc: lang_map[lang]!["Chronic Disease desc"],
      color: gradientPurple),
  ExampleOption(
      name: lang_map[lang]!["Fatigue"],
      desc: lang_map[lang]!["Fatigue desc"],
      color: gradientPink),
  ExampleOption(
      name: lang_map[lang]!["Allergy"],
      desc: lang_map[lang]!["Allergy desc"],
      color: gradientBlue),
  ExampleOption(
    name: lang_map[lang]!["Wheezing"],
    desc: lang_map[lang]!["Wheezing desc"],
    color: gradientPurple,
  ),
  ExampleOption(
      name: lang_map[lang]!["Alcohol Drinking"],
      desc: lang_map[lang]!["Alcohol Drinking desc"],
      color: gradientPink),
  ExampleOption(
    name: lang_map[lang]!["Cough"],
    desc: lang_map[lang]!["Cough desc"],
    color: gradientPink,
  ),
  ExampleOption(
    name: lang_map[lang]!["Shortness of Breath"],
    desc: lang_map[lang]!["Shortness of Breath desc"],
    color: gradientBlue,
  ),
  ExampleOption(
    name: lang_map[lang]!["Swallowing Difficulty"],
    desc: lang_map[lang]!["Swallowing Difficulty desc"],
    color: gradientPurple,
  ),
  ExampleOption(
      name: lang_map[lang]!["Chest Pain"],
      desc: lang_map[lang]!["Chest Pain desc"],
      color: gradientPurple),
];
