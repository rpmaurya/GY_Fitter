import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/component/video_player.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/home_constants.dart';
import 'package:fitness_app/get/weight_training_controller.dart';
import 'package:fitness_app/screen/notification_screen/notification_screen.dart';
import 'package:fitness_app/screen/payment_screen/membership_screen.dart';
import 'package:fitness_app/screen/recent_searches_screen/popular_trainer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// WeightTraining Controller
  WeightTrainingController weightTrainingController =
      Get.put(WeightTrainingController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            HomeConstants.titleName,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiSemiBold,
              fontSize: 20.sp,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                /// Navigator Notification Screen
                Get.to(() => const NotificationScreen());
              },
              icon: Icon(Icons.notifications_outlined, size: 25.sp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
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
                    hintText: HomeConstants.searchDetail,
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
                height: 20.h,
              ),

              /// Daily Activities Container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HomeConstants.activitiesName,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiSemiBold,
                        fontSize: 18.sp,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    // Container(
                    //   height: 120.h,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: HomeConstants.dailyActivities.length,
                    //     itemBuilder: (context, index) => Container(
                    //       margin: EdgeInsets.only(left: 35.r),
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             height: 50.h,
                    //             width: 36.w,
                    //             decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                 image: AssetImage(
                    //                   HomeConstants.dailyActivities[index]
                    //                       ['imageActivities'],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 14.h,
                    //           ),
                    //           Text( HomeConstants.dailyActivities[index]['detail'], style: TextStyle(
                    //               fontFamily: FontFamilyData.sfUiSemiBold,
                    //               fontSize: 16.sp,
                    //               color: Colors.black),),
                    //           Text( HomeConstants.dailyActivities[index]['help'], style: TextStyle(
                    //               fontFamily: FontFamilyData.sfUiRegularFont,
                    //               fontSize: 14.sp,
                    //               color: Colors.black),)
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        HomeConstants.dailyActivities.length,
                        (index) => Flexible(
                          child: Column(
                            children: [
                              Container(
                                height: 50.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      HomeConstants.dailyActivities[index]
                                          ['imageActivities'],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Text(
                                HomeConstants.dailyActivities[index]['detail'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiSemiBold,
                                  fontSize: 16.sp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                HomeConstants.dailyActivities[index]['help'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiRegularFont,
                                  fontSize: 14.sp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )
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
              SizedBox(
                height: 251.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            HomeConstants.workout,
                            style: TextStyle(
                              fontFamily: FontFamilyData.sfUiSemiBold,
                              fontSize: 18.sp,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// VideoPlayer ListView
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: HomeConstants.continueWorkout.length,
                        itemBuilder: (context, index) => Container(
                          margin: index == 1
                              ? EdgeInsets.only(right: 20.r, left: 20.r)
                              : EdgeInsets.only(left: 20.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: VideoPlayerComponent(
                              videoLink: HomeConstants.continueWorkout[index]
                                  ['workVideo'],
                              exercises: HomeConstants.continueWorkout[index]
                                  ['exercises'],
                              time: HomeConstants.continueWorkout[index]
                                  ['time'],
                              workoutName: HomeConstants.continueWorkout[index]
                                  ['workoutName'],
                            ),
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
              SizedBox(
                height: 55.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeConstants.weightTraining.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      /// Change Weight Training
                      weightTrainingController.weightTraining(index);
                    },
                    child: Obx(
                      () {
                        return Container(
                          alignment: Alignment.center,
                          margin: index == 3
                              ? EdgeInsets.only(right: 20.r, left: 20.r)
                              : EdgeInsets.only(left: 20.r),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.r,
                            vertical: 14.r,
                          ),
                          decoration: BoxDecoration(
                            color:
                                weightTrainingController.selectedIndex.value ==
                                        index
                                    ? Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black
                                    : Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                            border: Border.all(
                              color: weightTrainingController
                                          .selectedIndex.value ==
                                      index
                                  ? Get.isDarkMode
                                      ? const Color(0xff2F2F2F)
                                      : Colors.white
                                  : Get.isDarkMode
                                      ? const Color(0xff2F2F2F)
                                      : const Color(0xffE2E2E2),
                              width: 1.0.w,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            HomeConstants.weightTraining[index],
                            style: TextStyle(
                              fontFamily: FontFamilyData.sfUiSemiBold,
                              fontSize: 16.sp,
                              color: weightTrainingController
                                          .selectedIndex.value ==
                                      index
                                  ? Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white
                                  : Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 251.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            HomeConstants.trending,
                            style: TextStyle(
                              fontFamily: FontFamilyData.sfUiSemiBold,
                              fontSize: 18.sp,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// VideoPlayer ListView
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: HomeConstants.dailyActivities.length,
                        itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              margin: index == 2
                                  ? EdgeInsets.only(right: 20.r, left: 20.r)
                                  : EdgeInsets.only(left: 20.r),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: VideoPlayerComponent(
                                  videoLink: HomeConstants
                                      .trendingWorkout[index]['trendingVideo'],
                                  workoutName: HomeConstants
                                      .trendingWorkout[index]['trendingName'],
                                  exercises: HomeConstants
                                      .trendingWorkout[index]['exercises'],
                                  index: index,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 200.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Text(
                        HomeConstants.popular,
                        style: TextStyle(
                          fontFamily: FontFamilyData.sfUiSemiBold,
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
                        itemCount: HomeConstants.popularTrainers.length,
                        itemBuilder: (context, index) => Container(
                          padding: index == 3
                              ? EdgeInsets.only(right: 20.r, left: 20.r)
                              : EdgeInsets.only(left: 20.r),
                          child: InkWell(
                            onTap: () {
                              /// Navigator PopularTrainer Screen
                              Get.to(
                                  () => PopularTrainerScreen(
                                        image:
                                            HomeConstants.popularTrainers[index]
                                                ['trainersImage'],
                                        name:
                                            HomeConstants.popularTrainers[index]
                                                ['trainersName'],
                                        work:
                                            HomeConstants.popularTrainers[index]
                                                ['trainersPart'],
                                        trainerDetails:
                                            HomeConstants.popularTrainers[index]
                                                ['trainerDetails'],
                                        index: index,
                                      ),
                                  duration: const Duration(milliseconds: 800));
                            },
                            borderRadius: BorderRadius.circular(10.r),
                            splashColor: Colors.grey[200],
                            child: Column(
                              children: [
                                Hero(
                                  tag: index,
                                  child: SizedBox(
                                    height: 80.h,
                                    width: 80.w,
                                    child: CircleAvatar(
                                      backgroundImage:

                                          /// Cached NetworkImage Provider
                                          CachedNetworkImageProvider(
                                        HomeConstants.popularTrainers[index]
                                            ['trainersImage'],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  HomeConstants.popularTrainers[index]
                                      ['trainersName'],
                                  style: TextStyle(
                                    fontFamily: FontFamilyData.sfUiSemiBold,
                                    fontSize: 15.sp,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  HomeConstants.popularTrainers[index]
                                      ['trainersPart'],
                                  style: TextStyle(
                                    fontFamily: FontFamilyData.sfUiSemiMedium,
                                    fontSize: 12.sp,
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
                height: 40.h,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.r),
                    height: 215.h,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImageComponent(
                        imageUri: HomeConstants.joinImage,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.r,
                    right: 40.r,
                    child: SizedBox(
                      width: 150.w,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Text(
                            HomeConstants.joinTitle,
                            style: TextStyle(
                              fontFamily: FontFamilyData.sfUiSemiBold,
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            HomeConstants.joinDetail,
                            style: TextStyle(
                              fontFamily: FontFamilyData.sfUiRegularFont,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              /// Navigator MemberShipAd Screen
                              Get.to(() => const MemberShipAdScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 19.r, horizontal: 26.r),
                              alignment: Alignment.center,
                              height: 60.h,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: const Color(0xff101010),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                'JOIN NOW',
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiBoldFont,
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
