import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/constans/discover_constants.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/recent_searches_screen/full_body_workout_screen.dart';
import 'package:fitness_app/screen/recent_searches_screen/jhonny_evan_screen.dart';
import 'package:fitness_app/screen/recent_searches_screen/popular_trainer_screen.dart';
import 'package:fitness_app/screen/recent_searches_screen/recommended_workouts_screen.dart';
import 'package:fitness_app/screen/recent_searches_screen/squat_training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            DiscoverConstants.titleName,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),

              /// Search WorkOut Container
              Container(
                alignment: Alignment.center,
                height: 60.h,
                margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: DiscoverConstants.searchDetail,
                    hintStyle: TextStyle(
                      fontFamily: FontFamilyData.sfUiRegularFont,
                      fontSize: 16.sp,
                      color: Get.isDarkMode
                          ? const Color(0xff555555)
                          : const Color(0xffB8B8B8),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25.sp,
                      color: Get.isDarkMode
                          ? const Color(0xff555555)
                          : const Color(0xffB8B8B8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              ///  Recent Searches Container
              Container(
                margin: EdgeInsets.only(left: 20.r, right: 36.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DiscoverConstants.recentSearchesTitle,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 18.sp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: DiscoverConstants.recentSearches.length,
                      itemBuilder: (context, index) => InkWell(
                        /// Navigator Screen
                        /// Squat Traning Screen  and Full Body Workout Screen
                        onTap: () {
                          if (index == 0) {
                            Get.to(() => const SquatTrainingScreen());
                          }
                          if (index == 1) {
                            Get.to(() => const FullBodyWorkoutScreen());
                          }
                          if (index == 2) {
                            Get.to(const JhonnyEvanScreen());
                          }
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            DiscoverConstants.recentSearches[index],
                            style: TextStyle(
                              fontFamily: FontFamilyData.sfUiRegularFont,
                              fontSize: 18.sp,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : const Color(0xff2F2F2F),
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 22.sp,
                            color: Get.isDarkMode
                                ? Colors.white
                                : const Color(0xff101010),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),

              /// Recommended Workouts Container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DiscoverConstants.recommendedTitle,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 18.sp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemCount: DiscoverConstants.recommendedWorkouts.length,
                      itemBuilder: (context, index) => InkWell(
                        /// Navigator Screen
                        /// Recommended Workouts Screen
                        onTap: () {
                          Get.to(
                            () => RecommendedWorkoutsScreen(
                              image: (DiscoverConstants
                                  .recommendedWorkouts[index]['workoutsImage']),
                              title: (DiscoverConstants
                                  .recommendedWorkouts[index]['workoutsName']),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          height: 90.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Get.isDarkMode
                                  ? const Color(0xff2F2F2F)
                                  : const Color(0xffE2E2E2),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10.r),
                                ),
                                child: SizedBox(
                                  width: 90.w,
                                  height: 90.h,
                                  child: CachedNetworkImageComponent(
                                    imageUri: DiscoverConstants
                                            .recommendedWorkouts[index]
                                        ['workoutsImage'],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      (DiscoverConstants
                                              .recommendedWorkouts[index]
                                          ['workoutsName']),
                                      style: TextStyle(
                                        fontFamily: FontFamilyData.sfUiSemiBold,
                                        fontSize: 17.sp,
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          (DiscoverConstants
                                                  .recommendedWorkouts[index]
                                              ['workoutsExercises']),
                                          style: TextStyle(
                                            fontFamily:
                                                FontFamilyData.sfUiRegularFont,
                                            fontSize: 13.sp,
                                            color: Get.isDarkMode
                                                ? Colors.white
                                                : const Color(0xff555555),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          (DiscoverConstants
                                                  .recommendedWorkouts[index]
                                              ['workoutsTime']),
                                          style: TextStyle(
                                            fontFamily:
                                                FontFamilyData.sfUiRegularFont,
                                            fontSize: 14.sp,
                                            color: Get.isDarkMode
                                                ? Colors.white
                                                : const Color(0xff555555),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),

              /// Popular Trainers SizeBox
              SizedBox(
                height: 215.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Text(
                        DiscoverConstants.popular,
                        style: TextStyle(
                          fontFamily: FontFamilyData.sfUiBoldFont,
                          fontSize: 18.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: DiscoverConstants.popularTrainers.length,
                        itemBuilder: (context, index) => Container(
                          padding: index == 3
                              ? EdgeInsets.only(right: 20.r, left: 20.r)
                              : EdgeInsets.only(left: 20.r),
                          child: InkWell(
                            splashColor: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {
                              /// Navigator Screen
                              /// Popular Trainer Screen
                              Get.to(
                                () => PopularTrainerScreen(
                                  image: DiscoverConstants
                                      .popularTrainers[index]['trainersImage'],
                                  name: DiscoverConstants.popularTrainers[index]
                                      ['trainersName'],
                                  work: DiscoverConstants.popularTrainers[index]
                                      ['trainersPart'],
                                  trainerDetails: DiscoverConstants
                                      .popularTrainers[index]['trainerDetails'],
                                  index: index,
                                ),
                                duration: const Duration(milliseconds: 800),
                              );
                            },
                            child: Column(
                              children: [
                                Hero(
                                  tag: index,
                                  child: SizedBox(
                                    height: 90.h,
                                    width: 90.w,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        DiscoverConstants.popularTrainers[index]
                                            ['trainersImage'],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  DiscoverConstants.popularTrainers[index]
                                      ['trainersName'],
                                  style: TextStyle(
                                    fontFamily: FontFamilyData.sfUiSemiBold,
                                    fontSize: 16.sp,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  DiscoverConstants.popularTrainers[index]
                                      ['trainersPart'],
                                  style: TextStyle(
                                    fontFamily: FontFamilyData.sfUiSemiMedium,
                                    fontSize: 14.sp,
                                    color: Get.isDarkMode
                                        ? const Color(0xffE2E2E2)
                                        : const Color(0xff555555),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
