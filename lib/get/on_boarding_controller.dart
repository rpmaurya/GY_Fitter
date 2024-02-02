import 'package:fitness_app/component/on_boarding_info.dart';
import 'package:fitness_app/constans/image_path_constants.dart';
import 'package:fitness_app/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPage = 0.obs;
  PageController pageController = PageController();

  bool get isLastPage => selectedPage.value == onboardPage.length - 1;

  forwardAction() {
    if (isLastPage) {
      Get.to(() => const LoginScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onboardPage = [
    OnBoardingInfo(
      title: 'Workout On Your Terms',
      imageAsset: Get.isDarkMode
          ? ImagePath.darkOnBoardingFirst
          : ImagePath.onBoardingFirst,
      description:
          'Thousands of workout programmes coached by professional trainers.',
    ),
    OnBoardingInfo(
      imageAsset: Get.isDarkMode
          ? ImagePath.darkOnBoardingSecond
          : ImagePath.onBoardingSecond,
      title: 'Get Fit Don’t Quit',
      description:
          'Find workout that suit for you at home or at fitness studio.',
    ),
  ];
}
