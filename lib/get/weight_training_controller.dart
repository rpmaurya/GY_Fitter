import 'package:get/get.dart';

class WeightTrainingController extends GetxController {
  RxBool selectedItems = false.obs;
  RxInt selectedIndex = 0.obs;

  void weightTraining(int index) {
    selectedItems.value = true;
    selectedIndex.value = index;
  }
}
