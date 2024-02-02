import 'package:fitness_app/constans/image_path_constants.dart';
import 'package:fitness_app/get/bottom_navigation_bar_controller.dart';
import 'package:fitness_app/screen/bottom_bar_screen/discover_screen.dart';
import 'package:fitness_app/screen/home_screen.dart';
import 'package:fitness_app/screen/bottom_bar_screen/profile_screen.dart';
import 'package:fitness_app/screen/bottom_bar_screen/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  /// Add BottomNavigationBarController
  BottomNavigationBarController bottomNavigationBarController =
      Get.put(BottomNavigationBarController());

  /// BottomNavigationBar AllScreen
  List allScreen = [
    const HomeScreen(),
    const DiscoverScreen(),
    const TrainingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      /// Show AllPage
      body: Obx(
        () {
          return allScreen[bottomNavigationBarController.tabIndex.value];
        },
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 80.h,
        margin: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? const Color(0xff1A1A1A) : Colors.white,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade400,
              blurRadius: 12.r,
              offset: Offset(0.r, 5.r),
            )
          ],
        ),
        child: Obx(
          () {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  /// Navigator Home Screen
                  onTap: () {
                    bottomNavigationBarController.changeTabIndex(0);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    color: Theme.of(context).primaryColorDark,
                    child: Image.asset(
                      ImagePath.bottomHomeIcon,
                      color: bottomNavigationBarController.tabIndex.value == 0
                          ? Get.isDarkMode
                              ? Colors.white
                              : const Color(0xff101010)
                          : Get.isDarkMode
                              ? const Color(0xff555555)
                              : const Color(0xffB8B8B8),
                    ),
                  ),
                ),
                InkWell(
                  /// Navigator Discover Screen
                  onTap: () {
                    bottomNavigationBarController.changeTabIndex(1);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    color: Colors.transparent,
                    child: Image.asset(
                      ImagePath.bottomDiscoverIcon,
                      color: bottomNavigationBarController.tabIndex.value == 1
                          ? Get.isDarkMode
                              ? Colors.white
                              : const Color(0xff101010)
                          : Get.isDarkMode
                              ? const Color(0xff555555)
                              : const Color(0xffB8B8B8),
                    ),
                  ),
                ),
                InkWell(
                  /// Navigator Training Screen
                  onTap: () {
                    bottomNavigationBarController.changeTabIndex(2);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    color: Colors.transparent,
                    child: Image.asset(
                      ImagePath.bottomTrainingIcon,
                      color: bottomNavigationBarController.tabIndex.value == 2
                          ? Get.isDarkMode
                              ? Colors.white
                              : const Color(0xff101010)
                          : Get.isDarkMode
                              ? const Color(0xff555555)
                              : const Color(0xffB8B8B8),
                    ),
                  ),
                ),
                InkWell(
                  /// Navigator Profile Screen
                  onTap: () {
                    bottomNavigationBarController.changeTabIndex(3);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    color: Colors.transparent,
                    child: Image.asset(
                      ImagePath.bottomProfileIcon,
                      color: bottomNavigationBarController.tabIndex.value == 3
                          ? Get.isDarkMode
                              ? Colors.white
                              : const Color(0xff101010)
                          : Get.isDarkMode
                              ? const Color(0xff555555)
                              : const Color(0xffB8B8B8),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
