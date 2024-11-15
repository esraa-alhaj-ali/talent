import 'package:flutter/material.dart';
import 'package:talent/constant/app_images.dart';

import '../../Widget/app_scaffold.dart';
class WhoUs extends StatelessWidget {
  const WhoUs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      text: "من نحن",
      body: Column(
        children: [
          Image.asset(AppImages.imageLibrary),
          Text("data"),
        ],
      ),);
  }
}
