import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    required this.titlebutton,
    required this.onPressed,
    this.width = 290,
    this.height = 6,
  });
  final double width;
  final double height;
  final String titlebutton;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.w),
            gradient: AppColors.myGradient),
        child: Center(
          child: Text(
            titlebutton,
            style: AppTextStyle.buttonAuthTextSyle,
          ),
        ),
      ),
    );
  }
}
