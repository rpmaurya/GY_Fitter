import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/home_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularTrainerScreen extends StatelessWidget {
  const PopularTrainerScreen(
      {Key? key,
      this.name,
      this.image,
      this.work,
      required this.trainerDetails,
      this.index})
      : super(key: key);
  final String? image;
  final String? name;
  final String? work;
  final String trainerDetails;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return SafeAreaComponent(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            HomeConstants.popular,
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Hero(
                  tag: index!.toInt(),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    height: 150.h,
                    width: 150.w,
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        image.toString(),
                      ),
                    ),
                  ),
                ),
                Text(
                  name.toString(),
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiSemiBold,
                    fontSize: 25.sp,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  work.toString(),
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiSemiMedium,
                    fontSize: 20.sp,
                    color: Get.isDarkMode
                        ? const Color(0xffE2E2E2)
                        : const Color(0xff555555),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.r),
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    trainerDetails,
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiRegularFont,
                      fontSize: 18.sp,
                      color: Get.isDarkMode
                          ? const Color(0xffE2E2E2)
                          : const Color(0xff555555),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    /// Add SharedPreferences

                    /// Navigator Bottom Navigation Bar Screen
                  },
                  child: Container(
                    width: 120,
                    child: const ContainerComponent(
                      textData: 'Connect',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
