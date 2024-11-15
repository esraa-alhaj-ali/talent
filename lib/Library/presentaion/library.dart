import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:talent/Library/Bloc/Library_cubit.dart';
import 'package:talent/Library/Bloc/Library_state.dart';
import 'package:talent/Library/widget/custom_library.dart';
import '../../Offers/widget/try_again.dart';
import '../../Widget/custom_row.dart';

class Library extends StatelessWidget {
  LibraryCubit libraryCubit = LibraryCubit();
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        CustomRow(text: "المكتبة"),
        BlocProvider(
          create: (context) => libraryCubit..getLibrary(),
          child: BlocBuilder<LibraryCubit, LibraryState>(
              builder: (context, state) {
            return state is! LibraryLoadingState
                ? GridView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.w,
                      mainAxisSpacing: 2.h,
                      childAspectRatio: 1,
                    ),
                    itemCount: libraryCubit.LibraryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomLibrary(
                        librarya: libraryCubit.LibraryList[index],
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
        )
      ],
    );
  }
}
