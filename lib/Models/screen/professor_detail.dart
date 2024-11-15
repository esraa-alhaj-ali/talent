import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:talent/constant/app_images.dart';
import 'package:talent/constant/app_style.dart';

import '../../Courses_Add/Bloc/Course_cubit.dart';
import '../../Widget/app_scaffold.dart';
import '../../Widget/custom_courses.dart';


class ProfessorDetail extends StatelessWidget {
   ProfessorDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      text: 'اسم الدكتور',
      body: ListView(
       padding: EdgeInsets.symmetric(horizontal:3.w),
        children: [
          CircleAvatar(
            radius: 15.w,
            backgroundImage: AssetImage(AppImages.imageCourse),
          ),
          Text("datadtatdatadtadtadtadtadtadtadata"),
          Text("الكورسات",style:AppTextStyle.title),
      ListView.separated(
        separatorBuilder:(context, index) => SizedBox(height: 1.h,),
        padding:
        EdgeInsets.symmetric(horizontal: 3.w, vertical:1.h),
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:10,
        itemBuilder: (BuildContext context, int index) {
          return
            CustomCourses();
        },
      ),
        ],
      ),

    );
  }
}
