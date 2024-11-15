
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({
    Key? key,
    required this.onTap,
    this.small = false,
  }) : super(key: key);
  final Function()? onTap;
  final bool small;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 0.0, height: small ? 2.h : 5.h),
          Text(
            'حدث خطأ في الاتصال !',
          ),
          SizedBox(width: 0.0, height: small ? 2.h : 5.h),
          CustomElevatedButton(
              width: small ? 30 : 40,
              titlebutton: "أعد المحاولة",
              onPressed: onTap)
        ],
      ),
    );
  }
}
