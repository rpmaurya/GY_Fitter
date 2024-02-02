import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingBox {
  static ratingDialogData() {
    Get.dialog(RatingDialog(
      starSize: 40.r,
      onSubmitted: (response) {},
      title: Text(
        'Rating Dialog',
        style: TextStyle(
          fontFamily: FontFamilyData.sfUiBoldFont,
          fontSize: 25.sp,
        ),
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(
        fontFamily: FontFamilyData.sfUiBoldFont,
        fontSize: 20.sp,
      ),
    ));
  }
}
