import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  RxInt selectedPage = 0.obs;
  Rx<PageController> pageController = PageController().obs;

  bool get isLastPage => selectedPage.value == 2;

  forwardAction() {
    if (isLastPage) {
      Get.back();
      selectedPage = 0.obs;
    } else {
      pageController.value
          .nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  previousAction() {
    pageController.value
        .previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }
}
