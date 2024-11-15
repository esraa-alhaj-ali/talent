import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Contact_Us/Bloc/contact_us_cubit.dart';
import 'package:talent/Contact_Us/Bloc/contact_us_state.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_text_field.dart';

import 'package:talent/Profile/widget/profile_text_field.dart';

import '../../Feature/Auth/Presentation/Widget/show_toast.dart';
import '../../Widget/app_scaffold.dart';
import '../../constant/app_router.dart';
import '../../main_page.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  ContactUsCubit contactUsCubit = ContactUsCubit();

  final GlobalKey<FormState> KeyContactUs = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        text: "تواصل معنا",
        body: BlocProvider(
          create: (context) => contactUsCubit,
          child: Form(
            key: KeyContactUs,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                      label: "اسم المستخدم",
                      hintText: "ادخل اسم المستخدم",
                      controller: usernameController,
                      prefixIcon: Icons.person,
                      isValidator: true,
                  validatorMessage: "الرجاء ادخال اسم المتسخدم",),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                      label: "الايميل",
                      hintText: "ادخل الايميل",
                      controller: emailController,
                      prefixIcon: Icons.email,
                      isValidator: true,
                  validatorMessage: "الرجاء ادخال الايميل",),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    label: "الرسالة",
                    hintText: "ادخل الرسالة",
                    controller: messageController,
                    prefixIcon: Icons.email,
                    isValidator: true,
                    validatorMessage: "الرجاء ادخال الرسالة",
                  // line: 7,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocConsumer<ContactUsCubit, ContactUsState>(
                    listener: (context, state) {
                      if (state is ContactUsLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                            text: "تم ارسال الرسالة بنجاح",
                            state: ToastStates.Succes));
                        pushTo(context: context, toPage: MainPage());
                      } else if (state is ContactUsError) {
                        ScaffoldMessenger.of(context).showSnackBar(ShowToast(
                            text: state.message, state: ToastStates.Error));
                      }
                    },
                    builder: (context, state) {
                      return ConditionalBuilder(
                        condition: state is! ContactUsLoading,
                        builder: (context) => CustomElevatedButton(
                          titlebutton: "ارسال",
                          onPressed: () {
                            if (KeyContactUs.currentState!.validate()) {
                              contactUsCubit.ContactUs(
                                  username: usernameController.text,
                                  email: emailController.text,
                                  message: messageController.text);
                            }
                          },
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
