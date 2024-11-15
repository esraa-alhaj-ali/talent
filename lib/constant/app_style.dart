import 'package:flutter/material.dart';
 import 'package:sizer/sizer.dart';
class AppTextStyle{
  static final TextStyle title = TextStyle(
    fontSize:13.spa,
    color: Colors.black,
    height: 0.2.h,
    fontWeight: FontWeight.bold,
      fontFamily: "myFont"
  );
  static final TextStyle text = TextStyle(
    fontSize:12.spa,
    color: Colors.black,
    fontFamily: "myFont"
  );
  static final TextStyle subtitle = TextStyle(
    fontSize:9.spa,
    color: Colors.black,
    fontWeight: FontWeight.bold,
      fontFamily: "myFont"
  );
  static final TextStyle labelTextField = TextStyle(
    fontSize:9.5.spa,
    color:Color(0xFF424242),
    fontWeight: FontWeight.bold,
      fontFamily: "myFont"
  );
  static final TextStyle hintTextStyle = TextStyle(
    fontSize:9.spa,
    color: Colors.grey,
    height: 0.3.h,
    fontWeight: FontWeight.bold,
      fontFamily: "myFont"
  );
  static final TextStyle buttonAuthTextSyle =
  TextStyle(fontSize: 12.spa, color: Colors.white );
  static final TextStyle titlesAuthLarge = TextStyle(
    fontSize: 13.spa,
      fontFamily: "myFont"
  );
}