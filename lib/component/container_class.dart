import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContainerComponent extends StatelessWidget {
  const ContainerComponent({Key? key, this.textData}) : super(key: key);
  final String? textData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 19.r, horizontal: 26.r),
      alignment: Alignment.center,
      height: 60.h,
      width: size.width,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? const Color(0xff35C5F1) : const Color(0xff101010),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        textData.toString(),
        style: TextStyle(
          fontFamily: FontFamilyData.sfUiBoldFont,
          color: Theme.of(context).iconTheme.color,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
