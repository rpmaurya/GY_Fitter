import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/program_details_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScheduleDetailScreen extends StatelessWidget {
  const ScheduleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            margin: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              children: List.generate(
                ProgramDetailsConstans.ScheduleDetailScreen.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ProgramDetailsConstans.ScheduleDetailScreen[index]['title'],
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      ProgramDetailsConstans.ScheduleDetailScreen[index]['detail'],
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiRegularFont,
                        color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: GestureDetector(
              onTap: () {
                /// Navigator Select Schedule Screen
                Get.back();
              },
              child: const ContainerComponent(
                textData: 'ADD PROGRAM',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
