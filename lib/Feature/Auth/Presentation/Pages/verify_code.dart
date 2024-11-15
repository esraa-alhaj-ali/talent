import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Bloc/auth_cubit.dart';
import 'package:talent/Feature/Auth/Bloc/auth_state.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/reset_password.dart';
import 'package:talent/constant/app_colors.dart';
import 'package:pinput/pinput.dart';
import 'package:talent/constant/app_router.dart';

import '../../../../Widget/custom_clip_path.dart';
import '../../../../Widget/custom_elevated_button.dart';
import '../../../../constant/app_style.dart';
import '../Widget/show_toast.dart';

class VerifyCode extends StatelessWidget {
  AuthCubit authCubit = AuthCubit();
  final TextEditingController _verificationCode = TextEditingController();
  final String? email;
  VerifyCode({this.email});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => authCubit,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomClipPath(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("نسيت كلمة المرور", style: AppTextStyle.title),
                      Text("لقد تم ارسال رمز الى البريد الالكتروني",
                          style: AppTextStyle.text.copyWith(fontSize: 10.spa)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Pinput(
                        controller: _verificationCode,
                        length: 4,
                        defaultPinTheme: PinTheme(
                            height: 7.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.gry),
                              shape: BoxShape.circle,
                            )),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("لم أتلقى الرمز ؟", style: AppTextStyle.text),
                          Text(
                            "اعادة ارسال",
                            style: AppTextStyle.text.copyWith(
                                color: AppColors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is VerifyCodeSuccessfulState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                ShowToast(
                                    text: "تم تأكيد الرمز بنجاح",
                                    state: ToastStates.Succes));
                            pushTo(
                                context: context,
                                toPage: ResetPassword(
                                    email: email,
                                    verificationCode: _verificationCode.text));
                          } else if (state is ErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                ShowToast(
                                    text: state.message,
                                    state: ToastStates.Error));
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: state is! VerifyCodeLoadingState,
                            builder: (context) => Center(
                                child: CustomElevatedButton(
                                    titlebutton: "تأكيد الرمز",
                                    onPressed: () {
                                      if (_verificationCode.text.isNotEmpty) {
                                        authCubit.VerifyCode(
                                            email!, _verificationCode.text);
                                      }
                                    })),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
