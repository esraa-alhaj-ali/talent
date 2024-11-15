import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Apis/Urls.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';
import '../../constant/app_style.dart';
import '../models/section.dart';
class CustomSection extends StatelessWidget {
  Section? section;
  CustomSection({required this.section});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.w), // Image border
              child:
              CachedNetworkImage(
                fit: BoxFit.cover,
                width:53.w,height: 10.h,
                imageUrl: "${Urls.storageBaseUrl}${section!.image}",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.3.h,),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: AppColors.blue,
                gradient: AppColors.myGradient,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "${section!.name}",
                textAlign: TextAlign.center,
                style: AppTextStyle.title
                    .copyWith(fontSize: 9.spa, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
