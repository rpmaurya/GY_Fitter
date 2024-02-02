import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/profile_constants.dart';
import 'package:fitness_app/get/profile_week_progress_controller.dart';
import 'package:fitness_app/screen/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// Add Week Progress Controller
  WeekProgressController weekProgressController = Get.put(
    WeekProgressController(),
  );
  List<SalesKcal>? kcal;
  List<SalesTime>? time;
  double maxKcal = 235;
  double maxTime = 8;

  @override
  void initState() {
    kcal = [
      SalesKcal('M', 164),
      SalesKcal('T', 131),
      SalesKcal('W', 87),
      SalesKcal('T ', 86),
      SalesKcal('F', 229),
      SalesKcal('S', 198),
      SalesKcal('S ', 235),
    ];
    time = [
      SalesTime('M', 5),
      SalesTime('T', 2),
      SalesTime('W', 3),
      SalesTime('T ', 6),
      SalesTime('F', 8),
      SalesTime('S', 1),
      SalesTime('S ', 4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ProfileConstants.titleName,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              /// Navigator Setting Screen
              onPressed: () {
                Get.to(() => const SettingScreen());
              },
              icon: Icon(Icons.more_horiz, size: 28.sp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        /// Profile Image
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            ProfileConstants.profileImage,
                          ),
                          radius: 75.r,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ProfileConstants.profileName,
                              style: TextStyle(
                                fontFamily: FontFamilyData.sfUiBoldFont,
                                fontSize: 20.sp,
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              ProfileConstants.profileCountry,
                              style: TextStyle(
                                fontFamily: FontFamilyData.sfUiRegularFont,
                                fontSize: 16.sp,
                                color: Get.isDarkMode ? const Color(0xffE2E2E2) : const Color(0xff555555),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 29.h,
                    ),

                    /// User Detail
                    /// Weight, Height and Age
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        ProfileConstants.profileDetail.length,
                        (index) => Container(
                          height: 90.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ProfileConstants.profileDetail[index]['weight'],
                                      style: TextStyle(
                                        fontFamily: FontFamilyData.sfUiBoldFont,
                                        color: const Color(0xff35C5F1),
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ProfileConstants.profileDetail[index]['profilePersonTyp'],
                                      style: TextStyle(
                                        fontFamily: FontFamilyData.sfUiSemiMedium,
                                        color: const Color(0xff35C5F1),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                ProfileConstants.profileDetail[index]['profilePersonDetail'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiSemiMedium,
                                  color: Get.isDarkMode ? Colors.white : const Color(0xff2F2F2F),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                ProfileConstants.weekProgressTitle,
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiBoldFont,
                  fontSize: 20.sp,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Get.isDarkMode ? const Color(0xffB8B8B8) : Colors.black,
                    size: 22.sp,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    ProfileConstants.weekTime,
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiSemiMedium,
                      fontSize: 14.sp,
                      color: Get.isDarkMode ? const Color(0xffB8B8B8) : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Get.isDarkMode ? const Color(0xffB8B8B8) : Colors.black,
                    size: 22.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  ProfileConstants.weekProgress.length,
                  (index) => GestureDetector(
                    onTap: () {
                      /// Change Index kcal and time
                      weekProgressController.weekProgress(index);
                    },
                    child: Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: 15.r),
                        padding: EdgeInsets.symmetric(
                          vertical: 9.r,
                          horizontal: 20.r,
                        ),
                        decoration: BoxDecoration(
                          color: weekProgressController.selectedIndex.value == index
                              ? Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black
                              : Get.isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                          border: Border.all(
                            color: weekProgressController.selectedIndex.value == index
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black
                                : Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                            width: 1.0.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          ProfileConstants.weekProgress[index],
                          style: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            fontSize: 16.sp,
                            color: weekProgressController.selectedIndex.value == index
                                ? Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white
                                : Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),

              /// Show Chart Container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 60.r, vertical: 30.r),
                padding: EdgeInsets.zero,
                height: 250.h,

                /// Add PageView
                /// Change Chart Detail
                child: PageView(
                  controller: weekProgressController.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Kcal Chart
                    SfCartesianChart(
                      margin: EdgeInsets.zero,
                      plotAreaBorderWidth: 0,
                      zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
                      primaryXAxis: CategoryAxis(
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(width: 0),
                        majorGridLines: const MajorGridLines(width: 0),
                        labelStyle: TextStyle(
                          fontFamily: FontFamilyData.sfUiSemiBold,
                          fontSize: 18.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      primaryYAxis: CategoryAxis(isVisible: false),
                      series: <ChartSeries<SalesKcal, String>>[
                        ColumnSeries<SalesKcal, String>(
                          dataSource: kcal!,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            margin: EdgeInsets.zero,
                            labelAlignment: ChartDataLabelAlignment.outer,
                            textStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiRegularFont,
                              fontSize: 16.sp,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          pointColorMapper: (SalesKcal sales, _) {
                            if (sales.y == maxKcal) {
                              return Get.isDarkMode ? Colors.white : Colors.black;
                            } else {
                              return Get.isDarkMode ? const Color(0xff555555) : const Color(0xffB8B8B8);
                            }
                          },
                          borderRadius: BorderRadius.circular(20.r),
                          width: 0.45.w,
                          xValueMapper: (SalesKcal sales, _) => sales.x,
                          yValueMapper: (SalesKcal sales, _) => sales.y,
                        )
                      ],
                    ),

                    /// Time Chart
                    SfCartesianChart(
                      margin: EdgeInsets.zero,
                      plotAreaBorderWidth: 0,
                      zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
                      primaryXAxis: CategoryAxis(
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(width: 0),
                        majorGridLines: const MajorGridLines(width: 0),
                        labelStyle: TextStyle(
                          fontFamily: FontFamilyData.sfUiSemiBold,
                          fontSize: 18.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      primaryYAxis: CategoryAxis(isVisible: false),
                      series: <ChartSeries<SalesTime, String>>[
                        ColumnSeries<SalesTime, String>(
                          dataSource: time!,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            margin: EdgeInsets.zero,
                            labelAlignment: ChartDataLabelAlignment.outer,
                            textStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiRegularFont,
                              fontSize: 16.sp,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          pointColorMapper: (SalesTime sales, _) {
                            if (sales.y == maxTime) {
                              return Get.isDarkMode ? Colors.white : Colors.black;
                            } else {
                              return Get.isDarkMode ? const Color(0xff555555) : const Color(0xffB8B8B8);
                            }
                          },
                          borderRadius: BorderRadius.circular(20.r),
                          width: 0.45.w,
                          xValueMapper: (SalesTime sales, _) => sales.x,
                          yValueMapper: (SalesTime sales, _) => sales.y,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesKcal {
  SalesKcal(this.x, this.y);

  final String x;
  final double y;
}

class SalesTime {
  SalesTime(this.x, this.y);

  final String x;
  final double y;
}
