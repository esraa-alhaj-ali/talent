import 'package:flutter/material.dart';
import 'package:talent/Purchase_Orders/Presentation/await_purchase.dart';
import 'package:talent/constant/app_style.dart';

import '../../Widget/app_scaffold.dart';
import 'all_purchase.dart';
import 'approved_purchase.dart';
import 'cancel_purchase.dart';

class PurchaseOrders extends StatefulWidget {
  @override
  State<PurchaseOrders> createState() => _PurchaseOrdersState();
}

class _PurchaseOrdersState extends State<PurchaseOrders> {
  int current = 0;
  List<Widget> screens = [];
  @override
  Widget build(BuildContext context) {
    screens = [AllPurchase(), ApprovedPurchase(),AwaitPurchase(),CancelPurchase()];
    return AppScaffold(
      text: "طلبات الشراء",
      body: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             TextButton(
                 onPressed: (){
             setState(() {
               current=0;
             });
             }, child: Text("الكل",style: AppTextStyle.text,)),
             TextButton(onPressed: (){
               setState(() {
                 current=1;
               });
             }, child: Text("الموافق عليها",style: AppTextStyle.text)),
             TextButton(onPressed: (){
               setState(() {
                 current=2;
               });
             }, child: Text("المنتظرة",style: AppTextStyle.text)),

             TextButton(onPressed: (){
               setState(() {
                 current=3;
               });
             }, child: Text("الملغاة",style: AppTextStyle.text))
           ],
          ),
          Expanded(child: SingleChildScrollView(child: screens[current]))
        ],
      ),
    );
  }
}
