import 'package:get/get.dart';

class FirstSignUpController extends GetxController {
  RxBool selectedItems = false.obs;
  RxInt selectedIndex = 0.obs;

  void firstSignUp(int index) {
    selectedItems.value = true;
    selectedIndex.value = index;
  }
}
