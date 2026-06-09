import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFE0000);
  static const Color secondaryColor = Color(0xFFFECA00);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF323232);
  static const Color buttonTextColor = Color(0xFFFFFFFF);
  static const Color successColor = Color.fromARGB(255, 0, 190, 32);

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: buttonTextColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.symmetric(vertical: 15),
  );
}
