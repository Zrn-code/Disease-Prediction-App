import 'package:flutter/cupertino.dart';

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
    name: 'Cough',
    desc: 'd',
    color: gradientPink,
  ),
  ExampleOption(
    name: 'Fever',
    desc: 'd',
    color: gradientBlue,
  ),
  ExampleOption(
    name: 'Sore Throat',
    desc: 'd',
    color: gradientPurple,
  ),
  ExampleOption(
    name: 'Shortness of Breath',
    desc: 'Not getting enough.',
    color: gradientRed,
  ),
  ExampleOption(
    name: 'Headache',
    desc: 'd',
    color: gradientBlue,
  ),
  ExampleOption(
    name: 'Old Age',
    desc: 'Age is greater than 60',
    color: gradientPink,
  ),
  ExampleOption(
    name: 'Gender',
    desc: 'Male or Female',
    color: gradientPurple,
  ),
  ExampleOption(
    name: 'Test Indication',
    desc: 'd',
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

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
