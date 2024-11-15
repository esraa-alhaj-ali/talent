import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Purchase_Orders/widget/custom_purchase.dart';
import 'package:talent/constant/app_images.dart';
import 'package:talent/constant/app_style.dart';

class AllPurchase extends StatelessWidget {
  const AllPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return CustomPurchase(type: "ملغى",color: Colors.pink[100],);
      },
    );
  }
}
