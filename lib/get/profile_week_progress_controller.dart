import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeekProgressController extends GetxController {
  PageController pageController = PageController();
  RxBool selectedItems = false.obs;
  RxInt selectedIndex = 0.obs;

  void weekProgress(int index) {
    selectedItems.value = true;
    selectedIndex.value = index;
    pageController.animateToPage(
      selectedIndex.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}
