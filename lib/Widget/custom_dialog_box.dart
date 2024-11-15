
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_router.dart';
import 'package:talent/constant/app_style.dart';
import 'package:talent/main_page.dart';

import '../../Home/presentation/home.dart';

class CustomDialogBox extends StatefulWidget {
  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}
final TextEditingController _controller = TextEditingController();
class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'اسم الكورس',
        textAlign: TextAlign.center,
        style: AppTextStyle.title.copyWith(
          color: AppColors.blue,
        ),
      ),
      content: Text(
        '100000 ل.س',
        textAlign: TextAlign.center,
        style: AppTextStyle.titlesAuthLarge
            .copyWith(fontWeight: FontWeight.w700, color: Colors.blue[900]),
      ),
      actions: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 3.h),
            child: Text(
              "هل لديك كود حسم؟",
              textAlign: TextAlign.right,
              style: AppTextStyle.text,
            )),
        TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              label: Text(
                "ادخل كود الحسم",
                style: AppTextStyle.labelTextField,
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "اكتب هنا",
              hintStyle: AppTextStyle.hintTextStyle,
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: CustomElevatedButton(
              titlebutton: "التالي",
              onPressed: () {
                pushTo(context: context, toPage: CustomDialog2());
              }),
        )
      ],
    );
  }
}

class CustomDialog2 extends StatefulWidget {
  @override
  State<CustomDialog2> createState() => _CustomDialog2State();
}

class _CustomDialog2State extends State<CustomDialog2> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("كود الحسم: ", style: AppTextStyle.title),
            Text("986482 ", style: AppTextStyle.title),
            SizedBox(
              width:4.w,
            ),
            Text("30%", style: AppTextStyle.title)
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "سعر الكورس بعد الحسم :",
              style: AppTextStyle.labelTextField.copyWith(color: AppColors.blue),
            ),
            Text(
              "10000 ل.س",
              style: AppTextStyle.labelTextField.copyWith(color: Colors.red,decoration: TextDecoration.lineThrough),
            ),
            Text("7000 ل.س",style: AppTextStyle.labelTextField.copyWith(color: AppColors.blue,),),
          ],
        ),
        actions: <Widget>[
          Text("يرجى اختيار طريقة الدفع المناسبة لكي نتمكن من شراء الكورس",textAlign: TextAlign.center,style: AppTextStyle.text.copyWith(fontSize:11.spa),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio(
                    activeColor: AppColors.blue,
                    value: 'option1',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value; // Update the selected option
                      });
                    },
                  ),
                  Text("كاش",style: AppTextStyle.text,),
                ],
              ),
              Row(
                children: [
                  Radio(
                    activeColor: AppColors.blue,
                    value: 'Option2',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value; // Update the selected option
                      });
                    },
                  ),
                  Text("سيرياتيل كاش ",style: AppTextStyle.text,),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: CustomElevatedButton(
                titlebutton: "التالي",
                onPressed: () {
               pushTo(context: context, toPage: CustomDialog3());
                }),
          )
        ]);
  }
}


class CustomDialog3 extends StatelessWidget {
  const CustomDialog3({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("السعر ", style: AppTextStyle.title),
          Text("100000 ", style: AppTextStyle.title.copyWith(decoration: TextDecoration.lineThrough)),
          SizedBox(
            width:4.w,
          ),
          Text("7000%", style: AppTextStyle.title)
        ],
      ),
      content: Text("كاش",style: AppTextStyle.title,textAlign: TextAlign.center,),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("يرجى تحويل مبلغ وقدره 7000 ل.س على شركة الهرم او شركة الفؤاد الى المعلومات التالية",textAlign: TextAlign.center,style: AppTextStyle.text.copyWith(fontSize:11.spa),),
            Text("الاسم: محمد محمد"),
            Text("الرقم:202546"),
            Text("المحافظة:دمشق"),
            Text("يرجى رفع صورة الوصل"),
            TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: CustomElevatedButton(
                  titlebutton: "التالي",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CustomDialog4()),
                          (Route<dynamic> route) => false, // Remove all previous routes
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}

class CustomDialog4 extends StatelessWidget {
  const CustomDialog4({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: Text("تم ارسال طلبك بنجاح سيتم ارسال تأكيد طلبك"),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: CustomElevatedButton(
              titlebutton: "العودة الى الصفحة الرئيسية",
              onPressed: () {
              pushTo(context: context, toPage: MainPage());
              }),
        ),
      ],
    );
  }
}
