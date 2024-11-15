import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Models/screen/detail_courses.dart';
import 'package:talent/Models/screen/professor_detail.dart';
import 'package:talent/Proffesor/model/professor.dart';
import 'package:talent/Proffesor/model/proffesors.dart';
import 'package:talent/constant/app_router.dart';

import '../../Apis/Urls.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../../constant/app_style.dart';
import 'custom_elevated_button.dart';

class CustomProfessor extends StatelessWidget {
Professor instructor;
CustomProfessor({required this.instructor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 15.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.w),
          border: Border.all(color: AppColors.blue, width: 2)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.w),
            child:
              CachedNetworkImage(
                fit: BoxFit.cover,
                width:40.w,height: 15.h,
                imageUrl: "${Urls.storageBaseUrl}${instructor.image}",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${instructor.fullName}",
                    style: AppTextStyle.title,
                  ),
                  Text(
                    "${instructor.description}",
                    style: AppTextStyle.text,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomElevatedButton(
                    titlebutton: 'عرض الكورسات',
                    onPressed:(){
                      pushTo(context: context, toPage: ProfessorDetail());
                    },
                    width: 10.w,
                    height: 0.5.h,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
