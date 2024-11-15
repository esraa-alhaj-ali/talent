import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talent/Apis/Network.dart';
import 'package:talent/Discount_Code/presentation/discount_code.dart';
import 'package:talent/Feature/Auth/Presentation/Pages/sign_in.dart';
import 'package:talent/Helper/SharedPreferencesProvider.dart';
import 'package:talent/Helper/cash_helper.dart';
import 'package:talent/Change_Password/screen/change_password.dart';
import 'package:talent/Contact_Us/presentation/contact_us.dart';
import 'package:talent/Joint_Courses/presentation/Joint_courses.dart';
import 'package:talent/Courses_Add/presentation/add_courses.dart';
import 'package:talent/Models/screen/detail_courses.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Home/presentation/home.dart';
import 'package:talent/Models/screen/professor_detail.dart';
import 'package:talent/Who_Us/presentation/who_us.dart';
import 'package:talent/Proffesor/presentation/professor.dart';
import 'package:talent/Profile/presentation/profile_screen.dart';
import 'package:talent/Splash_Screen/splash_screen_step.dart';
import 'package:talent/Tests_Done/presentation/test_done.dart';
import 'Splash_Screen/splash_screen.dart';
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Network.init();

  print(AppSharedPreferences.getToken);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        maxMobileWidth: MediaQuery.of(context).size.width,
        maxTabletWidth: MediaQuery.of(context).size.width,
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale('er'),
              supportedLocales: const [
                Locale('ar'),
                Locale('en'),
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: SplashScreen());
        });
  }
}
