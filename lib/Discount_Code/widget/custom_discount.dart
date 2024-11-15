import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_style.dart';
class CustomDiscount extends StatelessWidget {
  const CustomDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 18.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(color: AppColors.blue, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "رقم الكود:12000",
                style: AppTextStyle.text,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "10000",
                style: AppTextStyle.text,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تاريخ صلاحية الكود:2024/2/4",
                style: AppTextStyle.text,
              ),
              Text(
                "مادة العلوم",
                style: AppTextStyle.title
                    .copyWith(color: AppColors.blue, fontSize: 12.spa),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
