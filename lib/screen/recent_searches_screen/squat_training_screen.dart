import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquatTrainingScreen extends StatelessWidget {
  const SquatTrainingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Squat Traning',
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {
            /// Navigator Discover Screen
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),

                  /// Cached NetworkImage Component
                  child: const CachedNetworkImageComponent(
                    imageUri:
                        'https://www.stylist.co.uk/images/app/uploads/2020/03/02111207/how-to-squat.jpg',
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                child: Text(
                  'BodyWeight jump-squat',
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiSemiBold,
                    fontSize: 25.sp,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.r),
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
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
                      '''Targets: Quadriceps, glues, calves, hamstrings and core.
Setup: All you need is yourself for this exercise.
Stance: To begin this movement, stand with your legs hip-width apart and either raise your hands in front of your body or clasp them together—whichever is more comfortable. Next, squat down pushing your hips back, and jump straight in the air. Once you land back on your feet squat down (imagining that you are sitting onto that chair) and push your hips back. Repeat. ''',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiRegularFont,
                        fontSize: 18.sp,
                        color: Get.isDarkMode
                            ? const Color(0xffE2E2E2)
                            : const Color(0xff555555),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
