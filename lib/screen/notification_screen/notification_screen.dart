import 'package:fitness_app/component/notification_component.dart';
import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/notification_constants.dart';
import 'package:fitness_app/screen/notification_screen/notification_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeAreaComponent(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            NotificationConstants.titleName,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            borderRadius: BorderRadius.circular(50.r),
            onTap: () {
              /// Navigator Bottom NavigationBar Screen
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: NotificationConstants.notificationList.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              /// Navigator NotificationDetails Screen
              Get.to(() => const NotificationDetailsScreen());
            },
            child: NotificationComponent(
              colorsTitle: NotificationConstants.notificationList[index]['isSelected'] == true
                  ? const Color(0xff35C5F1)
                  : Get.isDarkMode
                      ? Colors.white
                      : const Color(0xff101010),
              colorsDescription: NotificationConstants.notificationList[index]['isSelected'] == true
                  ? Get.isDarkMode
                      ? Theme.of(context).iconTheme.color
                      : const Color(0xff101010)
                  : Get.isDarkMode
                      ? const Color(0xffB8B8B8)
                      : const Color(0xff555555),
              familyFontTitle:
                  NotificationConstants.notificationList[index]['isSelected'] == true ? FontFamilyData.sfUiSemiBold : FontFamilyData.sfUiRegularFont,
              colorsContainer: NotificationConstants.notificationList[index]['isSelected'] == true
                  ? Get.isDarkMode
                      ? const Color(0xff2F2F2F)
                      : const Color(0xffF5F5F5)
                  : Get.isDarkMode
                      ? Colors.black
                      : Colors.white,
              title: NotificationConstants.notificationList[index]['title'],
              description: NotificationConstants.notificationList[index]['description'],
            ),
          ),
        ),
      ),
    );
  }
}
