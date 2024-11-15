import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_in.dart';

import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_images.dart';
import 'package:talent/constant/app_router.dart';
import 'package:talent/constant/app_style.dart';

import '../Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import '../Widget/custom_clip_splash.dart';
import '../Widget/custom_dots_indicator.dart';
import '../Widget/custom_page_view_item.dart';


class SplashScreenStep1 extends StatefulWidget {
  @override
  State<SplashScreenStep1> createState() => _SplashScreenStep1State();
}

class _SplashScreenStep1State extends State<SplashScreenStep1> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.logo,
              width: 50.w,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Positioned(
            height: 50.h,
            width: 100.w,
            bottom: 0,
            child: ClipPath(
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
            //   Image.asset(AppImages.clipImage,fit: BoxFit.cover,opacity:AlwaysStoppedAnimation(0.9),)
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: PageView(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                CustomPageViewItem(
                  image: AppImages.imageStep1,
                  text: 'أهلا بك في تطبيق مواهب',
                ),
                CustomPageViewItem(
                  image: AppImages.imageStep2,
                  text: 'طريقك للنجاح',
                ),
                CustomPageViewItem(
                  image: AppImages.imageStep3,
                  text: 'خطواتك الأولى تبدأ من هنا',
                ),
              ],
            ),
          ),
          // SizedBox(height:20.h,),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Positioned(
                bottom: 17.h,
                right: 0,
                left: 0,
                child: CustomDotsIndicator(
                  dotsCount: 3,
                  CurrentIndex: currentIndex,
                )),
          ),
          Positioned(
              bottom: 5.h,
              left: 3.w,
              right: 3.w,
              child: CustomElevatedButton(
                  titlebutton: "التالي",
                  onPressed: () {
                    pushTo(context: context, toPage: SignIn());
                  }))
        ],
      ),
    )));
  }
}
