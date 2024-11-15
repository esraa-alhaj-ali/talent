import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
class CustomDotsIndicator extends StatelessWidget {
 final int dotsCount;
 final int CurrentIndex;
  CustomDotsIndicator({required this.dotsCount, required this.CurrentIndex});
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount:dotsCount,
      position: CurrentIndex,
      decorator: DotsDecorator(
          size: const Size.square(9),
          activeSize: const Size(18.0, 9.0),
          color: Color(0xFF757575),
          activeShape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0)),
          activeColor: AppColors.blue),
    );
  }
}
