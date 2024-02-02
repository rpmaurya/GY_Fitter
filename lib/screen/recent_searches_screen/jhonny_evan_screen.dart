import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class JhonnyEvanScreen extends StatelessWidget {
  const JhonnyEvanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Jhonny Evan',
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
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.r),
                child: Text(
                  'The About of Jhonny Evan',
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
                margin: EdgeInsets.symmetric(horizontal: 25.r),
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
                      'It sounds pretty obvious, right? Working your whole body is going to mean that you\'re not prioritising one muscle group over another and will also mean you\'re building a well-rounded physique. But it\'s not just us saying that, there\'s a body of scientific research that\'s reached that conclusion too. For example, a study published in the Journal of Strength and Conditioning Research found that full-body workouts resulted in a superior hypertrophic effect, when compared with a traditional bodybuilding split where each muscle is trained once per week. In other words, if you want big muscles, full body workouts are how you build them.',
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
