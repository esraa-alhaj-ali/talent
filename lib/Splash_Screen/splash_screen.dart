import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Splash_Screen/splash_screen_step.dart';

import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_images.dart';
import 'package:talent/constant/app_router.dart';

import '../Widget/custom_clip_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
      Future.delayed(Duration(seconds: 3)  , (){

        pushTo(context: context, toPage: SplashScreenStep1());
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.h,),
            Image.asset(
              AppImages.logo,
              width: 60.w,
            ),
            Spacer(),
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipSplash(),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.blueclipbath,
                    ),
                    child: Image.asset(
                      AppImages.clipImage,
                      fit: BoxFit.cover,
                      opacity: AlwaysStoppedAnimation(0.4),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
