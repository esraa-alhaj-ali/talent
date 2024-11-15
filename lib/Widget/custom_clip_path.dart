import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.65);
    path.lineTo(size.width * 0.83, size.height);
    path.quadraticBezierTo(
        size.width * 0.93, size.height, size.width * 0.956, size.height * 0.8);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CustomClipPath extends StatelessWidget {
  final double height;
  CustomClipPath({this.height = 20});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        height: height.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blueclipbath,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, bottom: 7.h),
          child: Image.asset(
            width: 2.w,
            AppImages.logo,
          ),
        ),
      ),
    );
  }
}
