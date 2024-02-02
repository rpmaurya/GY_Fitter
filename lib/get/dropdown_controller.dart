import 'package:get/get.dart';

class DropDownController extends GetxController {
  Rx<String> selectedGender = ''.obs;
  Rx<String> selectedWeight = ''.obs;
  Rx<String> selectedHeight = ''.obs;
  List dropdownGender = ['Male', 'Female'];
  List dropdownWeight = ['1', '2'];
  List dropdownHeight = ['1', '2'];

  itemGender(String value) {
    selectedGender.value = value;
  }

  itemWeight(String value) {
    selectedWeight.value = value;
  }

  itemHeight(String value) {
    selectedHeight.value = value;
  }
}
