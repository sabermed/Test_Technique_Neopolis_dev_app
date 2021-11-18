import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2C5397);
const kPrimaryLightColor = Color(0xFFE2EDFF);
const kGreenColor = Color(0xFF23CE6B);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFF2C5397), Color(0xFF5C82C4)],
);

class Constants {
  Constants._();
  static const double padding = 20;
  static const double checkRadius = 45;
}
