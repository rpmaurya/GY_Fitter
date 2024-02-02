import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/get/sign_up_controller.dart';
import 'package:fitness_app/screen/signup_screen/first_signup_screen.dart';
import 'package:fitness_app/screen/signup_screen/second_signup_screen.dart';
import 'package:fitness_app/screen/signup_screen/third_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpOnBoardingScreen extends StatelessWidget {
  SignUpOnBoardingScreen({Key? key}) : super(key: key);
  final controllerData = Get.put(SignUpPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              /// PageView Add
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controllerData.pageController.value,
                onPageChanged: controllerData.selectedPage,

                /// Add All SignUp Screen
                children: const [
                  FirstSignUpScreen(),
                  SecondSignUpScreen(),
                  ThirdSignupScreen(),
                ],
              ),
              Positioned(
                top: 40.r,
                right: 32.r,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Obx(() {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.r),
                        height: 6.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: controllerData.selectedPage.value == index
                              ? const Color(0xff35C5F1)
                              : Get.isDarkMode
                                  ? const Color(0xff242424)
                                  : const Color(0xffE2E2E2),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                top: 20.r,
                left: 30.r,
                child: GestureDetector(onTap: () {
                  /// Navigator Back Screen
                  controllerData.previousAction();
                }, child: Obx(() {
                  return controllerData.selectedPage.value == 0
                      ? const Text('')
                      : Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: const Color(0xff35C5F1)),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 23.sp,
                            color: Colors.white,
                          ),
                        );
                })),
              ),
              Positioned(
                bottom: 40.r,
                right: 30.r,
                left: 30.r,
                child: GestureDetector(onTap: () {
                  /// Navigator Next Screen
                  controllerData.forwardAction();
                }, child: Obx(() {
                  return ContainerComponent(
                    textData: controllerData.isLastPage ? 'SIGNUP' : 'NEXT',
                  );
                })),
              ),
            ],
          )),
    );
  }
}
