import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_text_field.dart';
import 'package:talent/constant/app_router.dart';
import 'package:talent/constant/app_style.dart';

import '../../../../Widget/custom_clip_path.dart';
import '../../../../Widget/custom_elevated_button.dart';
import '../../Bloc/auth_cubit.dart';
import '../../Bloc/auth_state.dart';
import '../Widget/show_toast.dart';
import 'verify_code.dart';

class ForgetPassword extends StatelessWidget {
AuthCubit authCubit =AuthCubit();
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> formKeyForgetPassword = GlobalKey();
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => authCubit,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClipPath(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                child: Form(
                  key: formKeyForgetPassword,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("نسيت كلمة المرور", style: AppTextStyle.title),
                      Text(
                          "ادخل البريد الالكتروني او رقم الموبايل لكي يتم ارسال الرمز اليه",
                          style: AppTextStyle.text.copyWith(fontSize: 10.sp)),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomTextField(
                        label: "البريد الالكتروني/رقم الهاتف",
                        hintText: "ادخل البريد الالكتروني او رقم الهاتف",
                        controller: emailController,
                        prefixIcon: Icons.email,
                        isValidator: true,
                        validatorMessage: "الرجاء ادخال البريد الالكتروني",
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is SendCodeLoadingState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                ShowToast(
                                    text: "تم ارسال الرمز بنجاح",
                                    state: ToastStates.Succes));
                            pushTo(context: context, toPage: VerifyCode(email: emailController.text,));

                          } else if (state is ErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                ShowToast(
                                    text: state.message,
                                    state: ToastStates.Error));
                          }
                        },
                          builder: (context, state) {
                            return ConditionalBuilder(
                              condition: state is! LoadingState,
                              builder: (context) => Center(
                                  child: CustomElevatedButton(
                                      titlebutton: "تأكيد",
                                      onPressed: () {
                                        if (formKeyForgetPassword.currentState!
                                            .validate()) {
                                          authCubit.SendVerificationCode(
                                              email: emailController.text);
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
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
