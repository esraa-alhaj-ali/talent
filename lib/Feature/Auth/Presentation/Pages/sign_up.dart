import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_in.dart';
import 'package:talent/main_page.dart';

import '../../../../Home/presentation/home.dart';
import '../../../../Widget/custom_clip_path.dart';
import '../../../../Widget/custom_elevated_button.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_router.dart';
import '../../../../constant/app_style.dart';
import '../../Bloc/auth_cubit.dart';
import '../../Bloc/auth_state.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/loading_dialog.dart';
import '../Widget/show_toast.dart';

class SignUp extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  TextEditingController passwordConfController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthCubit authCubit = AuthCubit();
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "أهلا بك في تطبيق مواهب",
                              style: AppTextStyle.text,
                            ),
                            Text("انشاء حساب", style: AppTextStyle.title),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "اسم المستخدم",
                              hintText: "ادخل اسم المستخدم",
                              controller: userNameController,
                              prefixIcon: Icons.person,
                              textInputType: TextInputType.name,
                              isValidator: true,
                              validatorMessage: "الرجاء ادخال اسم المستخدم",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "الاسم الاول",
                              hintText: "ادخل الاسم الاول",
                              controller: firstNameController,
                              prefixIcon: Icons.person,
                              textInputType: TextInputType.name,
                              isValidator: true,
                              validatorMessage: "الرجاء ادخال الاسم الاول",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "الاسم الاخير",
                              hintText: "ادخل الاسم الاخير",
                              controller: lastNameController,
                              prefixIcon: Icons.person,
                              textInputType: TextInputType.name,
                              isValidator: true,
                              validatorMessage: "الرجاء ادخال الاسم الاخير",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "البريد الالكتروني",
                              hintText: "ادخل البريد الالكتروني",
                              controller: emailNameController,
                              prefixIcon: Icons.email,
                              textInputType: TextInputType.emailAddress,
                              isValidator: true,
                              validatorMessage:
                                  "الرجاء ادخال البريد الالكتروني",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "رقم الموبايل",
                              hintText: "ادخل رقم الموبايل",
                              controller: phoneNumberController,
                              prefixIcon: Icons.phone,
                              textInputType: TextInputType.number,
                              isValidator: true,
                              validatorMessage: "الرجاء ادخال رقم الموبايل",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "كلمة المرور",
                              hintText: "ادخل كلمة المرور",
                              controller: passwordNameController,
                              prefixIcon: Icons.lock,
                              isValidator: true,
                              validatorMessage: "الرجاء ادخال كلمة المرور",
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              label: "تأكيد كلمة المرور",
                              hintText: "تأكيد كلمة المرور",
                              controller: passwordConfController,
                              prefixIcon: Icons.lock,
                              isValidator: true,
                              validatorMessage: "الرجاء ادخال كلمة المرور",
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is SignUpSuccessState) {
                                  pushTo(context: context, toPage: SignIn());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      ShowToast(
                                          text: "تم انشاء الحساب بنجاح",
                                          state: ToastStates.Succes));
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
                                          titlebutton: "انشاء حساب",
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              authCubit.signup(
                                                  phone: phoneNumberController
                                                      .text,
                                                  username:
                                                      userNameController.text,
                                                  firstname:
                                                      firstNameController.text,
                                                  lastname:
                                                      lastNameController.text,
                                                  email:
                                                      emailNameController.text,
                                                  password:
                                                      passwordNameController
                                                          .text,
                                                  configPassword:
                                                      passwordConfController
                                                          .text);
                                            }
                                          }),
                                    ),
                                    fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },

                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("هل لديك حساب؟ ",
                                    style: AppTextStyle.text),
                                InkWell(
                                    onTap: () {
                                      pushTo(
                                          context: context, toPage: SignIn());
                                    },
                                    child: Text(
                                      "تسجيل دخول",
                                      style: AppTextStyle.text.copyWith(
                                          color: AppColors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors.blue),
                                    ))
                              ],
                            )
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
