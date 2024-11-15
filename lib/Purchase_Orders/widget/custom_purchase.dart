import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/app_images.dart';
import '../../constant/app_style.dart';
class CustomPurchase extends StatelessWidget {
 CustomPurchase({this.type,this.color});
String ? type;
Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.w),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("اسم الكورس",
                  style: AppTextStyle.title.copyWith(fontSize: 11.spa)),
             Container(
               padding: EdgeInsets.all(1.5.w),
               decoration: BoxDecoration(
                 color: color,
                 borderRadius: BorderRadius.circular(3.w)
               ),
               child:Text(type!,style: AppTextStyle.text.copyWith(fontSize: 11.spa),),
             )
            ],
          ),
          Row(
            children: [
              Text(
                "سعر الكورس : ",
                style: AppTextStyle.text.copyWith(fontSize: 11.spa),
              ),
              Text(" ل.س 12000",
                  style: AppTextStyle.text.copyWith(fontSize: 11.spa)),
            ],
          ),
          Image.asset(AppImages.imageLibrary)
        ],
      ),
    );
  }
}
