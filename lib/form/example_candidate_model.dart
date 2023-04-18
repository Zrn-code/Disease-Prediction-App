import 'package:flutter/cupertino.dart';

class ExampleCandidateModel {
  String? name;
  String? city;
  LinearGradient? color;

  ExampleCandidateModel({
    this.name,
    this.city,
    this.color,
  });
}

List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'Cough',
    city: 'Town',
    color: gradientPink,
  ),
  ExampleCandidateModel(
    name: 'Fever',
    city: 'Town',
    color: gradientBlue,
  ),
  ExampleCandidateModel(
    name: 'Sore Throat',
    city: 'Town',
    color: gradientPurple,
  ),
  ExampleCandidateModel(
    name: 'Shortness of Breath',
    city: 'Town',
    color: gradientRed,
  ),
  ExampleCandidateModel(
    name: 'Headache',
    city: 'Town',
    color: gradientBlue,
  ),
  ExampleCandidateModel(
    name: 'Old Age',
    city: 'greater than 60',
    color: gradientPink,
  ),
  ExampleCandidateModel(
    name: 'Test Indication',
    city: 'Town',
    color: gradientBlue,
  ),
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
