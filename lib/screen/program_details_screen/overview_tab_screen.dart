import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/program_details_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverviewDetailScreen extends StatelessWidget {
  const OverviewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Overview Detail Container
    return Container(
      color: Theme.of(context).primaryColorDark,
      margin: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        children: [
          Text(
            ProgramDetailsConstans.titleOverviewDetailScreen,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiRegularFont,
              color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Column(
            children: List.generate(
              ProgramDetailsConstans.OverviewDetailScreen.length,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ProgramDetailsConstans.OverviewDetailScreen[index]['title'],
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiRegularFont,
                      color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    ProgramDetailsConstans.OverviewDetailScreen[index]['detail'],
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiSemiBold,
                      color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () {
              /// Navigator Select Schedule Screen
              Get.back();
            },
            child: const ContainerComponent(
              textData: 'ADD PROGRAM',
            ),
          ),
        ],
      ),
    );
  }
}
