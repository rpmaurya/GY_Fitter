import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/first_signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirstSignUpScreen extends StatefulWidget {
  const FirstSignUpScreen({Key? key}) : super(key: key);

  @override
  State<FirstSignUpScreen> createState() => _FirstSignUpScreenState();
}

class _FirstSignUpScreenState extends State<FirstSignUpScreen> {
  List titleDetails = [
    'Lose Weight',
    'Get Fit',
    'Gain Muscle',
  ];

  List subDetails = [
    'Burn fat and get lean',
    'Tone up and feel healthy',
    'Build mass and strength',
  ];

  /// First SignUp Controller
  FirstSignUpController firstSignUpController =
      Get.put(FirstSignUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 100.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What is your goal?',
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 26.sp,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemCount: titleDetails.length,
            itemBuilder: (context, index) => GestureDetector(
              /// Chose Goal
              onTap: () {
                firstSignUpController.firstSignUp(index);
              },
              child: Obx(
                () {
                  /// Chose Goal Container
                  return Container(
                    padding: EdgeInsets.all(20.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            firstSignUpController.selectedIndex.value == index
                                ? const Color(0xff35C5F1)
                                : Get.isDarkMode
                                    ? const Color(0xff2F2F2F)
                                    : const Color(0xffE2E2E2),
                        width: 2.0.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleDetails[index],
                              style: TextStyle(
                                fontFamily: FontFamilyData.sfUiSemiBold,
                                //color: const Color(0xff101010),
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              subDetails[index],
                              style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiRegularFont,
                                  color: Get.isDarkMode
                                      ? const Color(0xffE2E2E2)
                                      : const Color(0xff555555),
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                        firstSignUpController.selectedIndex.value == index
                            ? Icon(
                                Icons.check_rounded,
                                color: const Color(0xff35C5F1),
                                size: 28.sp,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
