import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationComponent extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? colorsTitle;
  final Color? colorsDescription;
  final Color? colorsContainer;
  final String? familyFontTitle;

  const NotificationComponent(
      {Key? key,
      this.title,
      this.description,
      this.colorsTitle,
      this.colorsDescription,
      this.familyFontTitle,
      this.colorsContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: colorsContainer,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Get.isDarkMode
              ? const Color(0xff2F2F2F)
              : const Color(0xffE2E2E2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: TextStyle(
              fontFamily: familyFontTitle,
              color: colorsTitle,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            description.toString(),
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiRegularFont,
              color: colorsDescription,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
