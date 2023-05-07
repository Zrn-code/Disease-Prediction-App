import 'package:flutter_application/pages/main_page.dart';
import '../pages/login_page.dart';

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
  "0", // Sex
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

final List<Map<String, dynamic>> prediction_A_data = [
  {
    'title': lang_map[lang]!['Cough'],
    'index': 1,
  },
  {
    'title': lang_map[lang]!['Fever'],
    'index': 2,
  },
  {
    'title': lang_map[lang]!['Sore Throat'],
    'index': 3,
  },
  {
    'title': lang_map[lang]!['Shortness of Breath'],
    'index': 4,
  },
  {
    'title': lang_map[lang]!['Headache'],
    'index': 5,
  },
  {
    'title': lang_map[lang]!['Age 60 and Above'],
    'index': 6,
  },
  {
    'title': lang_map[lang]!['Gender'],
    'index': 7,
  },
  {
    'title': lang_map[lang]!['Test Indication'],
    'index': 8,
  }
];

final List<Map<String, dynamic>> prediction_B_data = [
  {
    "title": lang_map[lang]!['Gender'],
    "index": 1,
  },
  {
    "title": lang_map[lang]!["Polyuria"],
    "index": 2,
  },
  {
    "title": lang_map[lang]!["Polydipsia"],
    "index": 3,
  },
  {
    "title": lang_map[lang]!["Sudden Weight Loss"],
    "index": 4,
  },
  {
    "title": lang_map[lang]!["Weakness"],
    "index": 5,
  },
  {
    "title": lang_map[lang]!["Polyphagia"],
    "index": 6,
  },
  {
    "title": lang_map[lang]!["Genital Thrush"],
    "index": 7,
  },
  {
    "title": lang_map[lang]!["Visual Blurring"],
    "index": 8,
  },
  {
    "title": lang_map[lang]!["Itching"],
    "index": 9,
  },
  {
    "title": lang_map[lang]!["Irritability"],
    "index": 10,
  },
  {
    "title": lang_map[lang]!["Delayed Healing"],
    "index": 11,
  },
  {
    "title": lang_map[lang]!["Partial Paresis"],
    "index": 12,
  },
  {
    "title": lang_map[lang]!["Muscle Stiffness"],
    "index": 13,
  },
  {
    "title": lang_map[lang]!["Alopecia"],
    "index": 14,
  },
  {
    "title": lang_map[lang]!["Obesity"],
    "index": 15,
  },
];

final List<Map<String, dynamic>> prediction_C_data = [
  {
    "title": lang_map[lang]!["Gender"],
    "index": 8,
  },
  {
    "title": lang_map[lang]!["Smoking"],
    "index": 2,
  },
  {
    "title": lang_map[lang]!["Alcohol Drinking"],
    "index": 3,
  },
  {
    "title": lang_map[lang]!["Stroke"],
    "index": 4,
  },
  {
    "title": lang_map[lang]!["Walking Difficulty"],
    "index": 7,
  },
  {
    "title": lang_map[lang]!["Diabetic"],
    "index": 10,
  },
  {
    "title": lang_map[lang]!["Physical Activity"],
    "index": 11,
  },
  {
    "title": lang_map[lang]!["Asthma"],
    "index": 14,
  },
  {
    "title": lang_map[lang]!["Kidney Disease"],
    "index": 15,
  },
  {
    "title": lang_map[lang]!["Skin Cancer"],
    "index": 16,
  }
];

final List<Map<String, dynamic>> prediction_D_data = [
  {
    "title": lang_map[lang]!["Gender"],
    "index": 1,
  },
  {
    "title": lang_map[lang]!["Smoking"],
    "index": 3,
  },
  {
    "title": lang_map[lang]!["Yellow Fingers"],
    "index": 4,
  },
  {
    "title": lang_map[lang]!["Anxiety"],
    "index": 5,
  },
  {
    "title": lang_map[lang]!["Peer Pressure"],
    "index": 6,
  },
  {
    "title": lang_map[lang]!["Chronic Disease"],
    "index": 7,
  },
  {
    "title": lang_map[lang]!["Fatigue"],
    "index": 8,
  },
  {
    "title": lang_map[lang]!["Allergy"],
    "index": 9,
  },
  {
    "title": lang_map[lang]!["Wheezing"],
    "index": 10,
  },
  {
    "title": lang_map[lang]!["Alcohol Drinking"],
    "index": 11,
  },
  {
    "title": lang_map[lang]!["Cough"],
    "index": 12,
  },
  {
    "title": lang_map[lang]!["Shortness of Breath"],
    "index": 13,
  },
  {
    "title": lang_map[lang]!["Swallowing Difficulty"],
    "index": 14,
  },
  {
    "title": lang_map[lang]!["Chest Pain"],
    "index": 15,
  }
];
