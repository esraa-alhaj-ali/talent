import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Feature/Auth/Presentation/Widget/custom_elevated_button.dart';
import 'package:talent/Section/Bloc/section_cubit.dart';
import 'package:talent/Section/Bloc/section_state.dart';
import 'package:talent/constant/app_colors.dart';
import 'package:talent/constant/app_images.dart';
import 'package:talent/constant/app_style.dart';
import 'package:video_player/video_player.dart';
import '../../Offers/widget/try_again.dart';
import '../../Section/widget/custom_section.dart';
import '../../Widget/app_scaffold.dart';
import 'package:flick_video_player/flick_video_player.dart';

import '../../Widget/custom_dialog_box.dart';

class DetailCourses extends StatefulWidget {
  @override
  State<DetailCourses> createState() => _DetailCoursesState();
}

class _DetailCoursesState extends State<DetailCourses> {
  late FlickManager flickManager;
  @override
  void initState() {
    // TODO: implement initState
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")));
    super.initState();
  }

  SectionCubit sectionCubit = SectionCubit();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      text: "اسم الكورس الواحد",
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "12000 ل.س",
                style: AppTextStyle.title,
              ),
              SizedBox(height:1.h,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                ),
              ),
              SizedBox(height:2.h ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "شرح الكورس",
                    style: AppTextStyle.title.copyWith(color: AppColors.blue),
                  ),
                  Text("30 ساعة",
                      style: AppTextStyle.title.copyWith(color: AppColors.blue)),
                ],
              ),
              Text(
                "عِلْمُ الكِيمِيَاءِ هو العلم الذي يدرس المادة والتغيُّرات التي تطرأ عليها،تحديدًا بدراسة خواصها، بِنيتها، تركيبها، سلوكها، تفاعلاتها وما تحدثه من خلالها.ويدرس علم الكيمياء الذرات والروابط التي تحدث بينها مكونةً الجزيئات، وكيف تترابط هذه الجزيئات فيما بعدها لتُكوّن المادة ويدرس أيضًا التفاعلات التي تحدث بينه للكيمياء أهمية كبيرة في حياتنا، وتدخل في مجالات كثيرة وتلعب دورًا مهمًا في الصناعات بمختلف أنواعها، كالصِّناعات الغذائية، صناعة المواد التنظيفية، الدهانات، الأصبغة، صناعة الأدوية والعقاقير، النسيج والملابس والأسلحة وغيرها. ولها تطبيقات أخرى في الطب والعلوم الأخر ويطلق على الكيمياء تسمية «العِلْمُ المَرْكَزِي ذلك لدورهِ الجوهري في ربط العلوم الطبيعية ببعضها.",
                style: AppTextStyle.text,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        AppImages.imageCourse,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "اسم الدكتور",
                      style: AppTextStyle.text,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                        child: Text(
                      "عرض",
                      style: AppTextStyle.text.copyWith(
                          color: AppColors.blue,
                          decoration: TextDecoration.underline),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text("أقسام الكورس", style: AppTextStyle.title),
              BlocProvider(
                create: (context) => sectionCubit..getSection(),
                child: BlocBuilder<SectionCubit, SectionState>(
                    builder: (context, state) {
                  if (state is SectionLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.w,
                      mainAxisSpacing: 0.5.h,
                      childAspectRatio: 1,
                    ),
                    itemCount: sectionCubit.sectionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomSection(
                        section: sectionCubit.sectionList[index],
                      );
                    },
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                child: CustomElevatedButton(
                    titlebutton: "شراء",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox();
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
