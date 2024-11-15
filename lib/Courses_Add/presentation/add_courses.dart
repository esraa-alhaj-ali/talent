import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Courses_Add/Bloc/Course_cubit.dart';
import 'package:talent/Courses_Add/Bloc/Course_state.dart';

import '../../Widget/app_scaffold.dart';
import '../../Widget/custom_courses.dart';


class CoursesAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      text: "الكورسات المضافة اخيرا",
      body: Expanded(
        child: ListView.separated(
          separatorBuilder:(context, index) => SizedBox(height: 1.h,),
          padding:
          EdgeInsets.symmetric(horizontal: 3.w, vertical:1.h),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:10,
          itemBuilder: (BuildContext context, int index) {
            return CustomCourses(
            );
          },
        ),
      ),);
  }
}
