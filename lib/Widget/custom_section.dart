// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../constant/app_colors.dart';
// import '../../constant/app_images.dart';
// import '../../constant/app_style.dart';
//
// class CustomSection extends StatelessWidget {
//  final String text;
//   CustomSection({required this.text});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.w), // Image border
//               child: Image.asset(
//                 AppImages.imageLibrary,
//                 fit: BoxFit.cover,
//                 height: 13.h,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 0.5.h),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.w),
//                 color: AppColors.blue,
//                 gradient: AppColors.myGradient,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset:
//                     Offset(0, 0.5), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Text(
//                text!,
//                 textAlign: TextAlign.center,
//                 style: AppTextStyle.title
//                     .copyWith(fontSize: 9.spa, color: Colors.white),
//               ),
//             ),
//           ],
//         ));
//
//   }
// }
