import 'package:fitness_app/component/video_player.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/training_constants.dart';
import 'package:fitness_app/screen/schedule_screen/select_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TrainingConstants.titleName,
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            /// Navigator Select Schedule Screen
            onPressed: () {
              Get.to(() => const SelectScheduleScreen());
            },
            icon: Icon(
              Icons.date_range_outlined,
              size: 25.sp,
            ),
          ),
        ],
      ),

      /// Show All Videos
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: TrainingConstants.trendingVideos.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.r),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TrainingConstants.scheduleTitle,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiRegularFont,
                        fontSize: 16.sp,
                        color: Get.isDarkMode ? Colors.white : const Color(0xff2F2F2F),
                      ),
                    ),
                    SizedBox(
                      width: 130.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            TrainingConstants.scheduleDay.length,
                            (index) => Text(
                                  TrainingConstants.scheduleDay[index],
                                  style: TextStyle(
                                    fontFamily: FontFamilyData.sfUiBoldFont,
                                    fontSize: 14.sp,
                                    color: Get.isDarkMode ? const Color(0xff555555) : const Color(0xffB8B8B8),
                                  ),
                                )).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10.r),
                ),

                /// Video Player Page
                child: VideoPlayerComponent(
                  videoLink: TrainingConstants.trendingVideos[index]['trendingVideo'],
                  exercises: TrainingConstants.trendingVideos[index]['trendingExercises'],
                  time: TrainingConstants.trendingVideos[index]['trendingTime'],
                  workoutName: TrainingConstants.trendingVideos[index]['trendingName'],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
