import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_style.dart';

class CustomRow extends StatelessWidget {
  final String text;
  CustomRow({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyle.title,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 7.w,
              ))
        ],
      ),
    );

  }
}