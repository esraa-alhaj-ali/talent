import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Offers/models/offer.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../../constant/app_style.dart';

class CustomContainer extends StatelessWidget {
  final Offer offer;
 CustomContainer({required this.offer,});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.imageHome),
              fit: BoxFit.cover,
            ),
            color: AppColors.blue,
            gradient: AppColors.myGradient,
            borderRadius: BorderRadius.circular(12.w)),
        child: Padding(
          padding: EdgeInsets.only(top: 3.h, right: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${offer.name}',
                  style: AppTextStyle.text.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Text(
                "${offer.description}",
                style: AppTextStyle.text.copyWith(color: Colors.white),
              ),
              Text(
                "${offer.discount}",
                style: AppTextStyle.text
                    .copyWith(fontSize: 10.sp, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
