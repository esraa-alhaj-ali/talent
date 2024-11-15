import 'package:flutter/material.dart';

class AppColors{
  static const Color blue=Color(0xFF0063BE);
  static const Color bluecolorbutton=Color(0xFF00264A);
  static const Color blueclipbath=Color(0xFF82B1FF);
  static const Color gry=Color(0xFFB7B7B7);
  static const LinearGradient myGradient = LinearGradient(
    colors: [
      AppColors.blue,
      AppColors.bluecolorbutton
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
