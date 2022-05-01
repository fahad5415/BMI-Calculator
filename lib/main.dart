import 'package:bmi_calculator/ui/bmi_calculator.dart';
import 'package:bmi_calculator/ui/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0D22),
        primaryColor: Color(0xff0A0D22)),
    home: BMICalculator(),
  ));
}
