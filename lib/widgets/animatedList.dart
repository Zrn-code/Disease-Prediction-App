import 'package:flutter/material.dart';
import 'package:flutter_application/pages/main_page.dart';
import 'colors.dart';
import '../pages/login_page.dart';
import '../data/restore_data.dart';

Widget buildTile_A(String title, int index) {
  return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: prediction_A[index] == "1"
                  ? title == lang_map[lang]!["Gender"]
                      ? Colors.blue
                      : Colors.green
                  : title == lang_map[lang]!["Gender"]
                      ? Colors.pink
                      : Colors.red),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            prediction_A[index] == "1"
                ? title == lang_map[lang]!["Gender"]
                    ? Icons.male_rounded
                    : Icons.check_rounded
                : title == lang_map[lang]!["Gender"]
                    ? Icons.female_rounded
                    : Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ]));
}

Widget buildTile_B(String title, int index) {
  return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: prediction_B[index] == "1"
                  ? title == lang_map[lang]!["Gender"]
                      ? Colors.blue
                      : Colors.green
                  : title == lang_map[lang]!["Gender"]
                      ? Colors.pink
                      : Colors.red),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            prediction_B[index] == "1"
                ? title == lang_map[lang]!["Gender"]
                    ? Icons.male_rounded
                    : Icons.check_rounded
                : title == lang_map[lang]!["Gender"]
                    ? Icons.female_rounded
                    : Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ]));
}

Widget buildTile_C(String title, int index) {
  return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: prediction_C[index] == "1"
                  ? title == lang_map[lang]!["Sex"]
                      ? Colors.blue
                      : Colors.green
                  : title == lang_map[lang]!["Sex"]
                      ? Colors.pink
                      : Colors.red),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            prediction_C[index] == "1"
                ? title == lang_map[lang]!["Sex"]
                    ? Icons.male_rounded
                    : Icons.check_rounded
                : title == lang_map[lang]!["Sex"]
                    ? Icons.female_rounded
                    : Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ]));
}

Widget buildTile_D(String title, int index) {
  return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: prediction_D[index] == "2"
                  ? title == lang_map[lang]!["Gender"]
                      ? Colors.blue
                      : Colors.green
                  : title == lang_map[lang]!["Gender"]
                      ? Colors.pink
                      : Colors.red),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            prediction_D[index] == "2"
                ? title == lang_map[lang]!["Gender"]
                    ? Icons.male_rounded
                    : Icons.check_rounded
                : title == lang_map[lang]!["Gender"]
                    ? Icons.female_rounded
                    : Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ]));
}
