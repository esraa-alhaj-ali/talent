
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void pushTo({required BuildContext context, required Widget toPage}) {
  Navigator.of(context).push(
      PageTransition(child: toPage, type: PageTransitionType.leftToRight));
}
