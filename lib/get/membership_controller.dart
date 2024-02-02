import 'package:get/get.dart';

class MemberShipAdController extends GetxController {
  RxBool selectedItems = false.obs;
  RxInt selectedIndex = 0.obs;

  void membershipAd(int index) {
    selectedItems.value = true;
    selectedIndex.value = index;
  }
}
