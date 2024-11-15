import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Discount_Code/widget/custom_discount.dart';

import '../../Widget/app_scaffold.dart';


class DiscountCode extends StatelessWidget {
  const DiscountCode({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      text: "اكواد الحسم",
      body: ListView.separated(
        separatorBuilder:(context, index) => SizedBox(height: 1.h,),
        padding:
        EdgeInsets.symmetric(horizontal: 3.w, vertical:1.h),
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CustomDiscount();
        },
      )
    );
  }
}
