import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/app_style.dart';

class CustomTextButton extends StatelessWidget {
  String? text;
  Function() ? onTap;
  CustomTextButton({required this.text,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size(double.infinity, 0),
          ),
          onPressed:onTap,
          child: Text("$text",
              style: AppTextStyle.text)),
    );
  }
}
