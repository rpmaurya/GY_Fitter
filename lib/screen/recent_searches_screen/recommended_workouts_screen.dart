import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/discover_constants.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendedWorkoutsScreen extends StatelessWidget {
  final String? image;
  final String? title;

  const RecommendedWorkoutsScreen({Key? key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          (DiscoverConstants.recommendedTitle),
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Text(
                title.toString(),
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiSemiBold,
                  fontSize: 18.sp,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 300.h,
              width: double.infinity,
              color: Theme.of(context).primaryColorDark,
              margin: EdgeInsets.symmetric(vertical: 20.r, horizontal: 20.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImageComponent(
                  imageUri: image.toString(),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Theme.of(context).primaryColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.r),
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'As you would expect, gym instructors need to have skills centred around safe and effective gym usage. This includes knowing how to use and instruct people on every single gym machine. They should also know how to deliver safe and effective group exercise classes.Since gym instructors will be interacting with members all day, the best gym instructors tend to be outgoing, talkative, energetic, observant and hard-working.',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiRegularFont,
                      fontSize: 18.sp,
                      color: Get.isDarkMode ? const Color(0xffE2E2E2) : const Color(0xff555555),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const ContainerComponent(
                      textData: 'Back',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
