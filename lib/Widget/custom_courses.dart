import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Courses_Add/Course_Models/course.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../../constant/app_style.dart';
import 'custom_elevated_button.dart';

class CustomCourses extends StatelessWidget {
  CustomCourses({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 18.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(color: AppColors.blue, width: 2)),
      child: Row(
        children: [
          Container(
              width: 30.w,
              height: 18.h,
              child: Image.asset(AppImages.imageCourse, fit: BoxFit.cover)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "اسم الكورس",
                        style: AppTextStyle.title,
                      ),
                      Text(
                        "اسم الدكتور",
                        style: AppTextStyle.text,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "12000",
                        style: AppTextStyle.title,
                      ),
                      Text(
                        "12 ساعة",
                        style: AppTextStyle.text,
                      ),
                    ],
                  ),
                  Text(
                    "منهج علم الوراثة",
                    style: AppTextStyle.text,
                  ),
                  CustomElevatedButton(
                    titlebutton: 'عرض',
                    onPressed: () {},
                    width: 10.w,
                    height: 0.5.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
