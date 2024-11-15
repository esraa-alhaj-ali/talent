import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Home/presentation/home.dart';
import '../../constant/app_router.dart';
import '../../constant/app_style.dart';
import 'custom_clip_path.dart';

class AppScaffold extends StatelessWidget {
  String text;
  Widget body;
  AppScaffold({required this.body, required this.text});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CustomClipPath(
                  height: 2.h,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical:1.5.h),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$text",
                    style: AppTextStyle.title,
                  ),
                  IconButton(
                      onPressed: () {
                     Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),

            Expanded(child: body)

          ],
        ),
      ),
    );
  }
}
