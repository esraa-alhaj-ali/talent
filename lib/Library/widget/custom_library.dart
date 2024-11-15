import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'package:talent/constant/app_style.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../models/library.dart';

class CustomLibrary extends StatelessWidget {
  late Librarya librarya;
  CustomLibrary({required this.librarya});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(5);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius:12,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               Image.asset(AppImages.imagePdf,width:15.w,),
                Text("${librarya.name}",style: AppTextStyle.text,),
              ],
            ),
            CustomElevatedButton(titlebutton: "فتح الكتاب", onPressed: () {},)
          ],
        ),
      ),
    );
  }
}
