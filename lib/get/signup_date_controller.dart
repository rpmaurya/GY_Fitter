import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpDateController extends GetxController {
  Rx<TextEditingController> dateController = TextEditingController().obs;
  var selectedDate = DateTime.now().obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      lastDate: DateTime(2024),
      firstDate: DateTime(1970),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      dateController.value.text =
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      //print(selectedDate.value);
    }
  }
}
