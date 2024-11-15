import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constant/app_images.dart';
import '../../constant/app_style.dart';
class CustomPageViewItem extends StatelessWidget {
final String image;
final String text;


CustomPageViewItem({required this.image,required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 18.h,),
          SizedBox(
            height: 40.h,
            width: 100.w,
            child: Image.asset(image,
             ),
          ),
          SizedBox(height:3.h,),
          Text(text,style: AppTextStyle.text.copyWith(fontWeight: FontWeight.bold),),

        ],
      );
  }
}
