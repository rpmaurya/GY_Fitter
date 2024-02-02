import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/notification_details_constants.dart';
import 'package:fitness_app/screen/bottom_bar_screen/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeAreaComponent(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            NotificationDetailsConstants.titleName,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            borderRadius: BorderRadius.circular(50.r),

            /// Navigator Notification Screen
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: Theme.of(context).primaryColorDark,
            margin: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),

                  ///  Add Cached Network Image Component
                  child: CachedNetworkImageComponent(
                    imageUri: NotificationDetailsConstants.imageNotification,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  NotificationDetailsConstants.notificationTitle,
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiBoldFont,
                    fontSize: 20.sp,
                    color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  NotificationDetailsConstants.notificationDetail,
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiRegularFont,
                    fontSize: 18.sp,
                    color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                GestureDetector(
                  /// Navigator Bottom NavigationBar Page
                  onTap: () {
                    Get.offAll(() => const BottomNavigationBarScreen());
                  },
                  child: const ContainerComponent(
                    textData: 'GO TO YOUR TRAINING',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
