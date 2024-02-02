import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/visibility_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Visibility Password Controller
  VisibilityPasswordController visibilityPasswordController = Get.put(VisibilityPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeAreaComponent(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      ///Navigator Verification Code Screen
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15.r),
                        alignment: Alignment.center,
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xff35C5F1),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 23.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 26.sp,
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Obx(
                      /// New Password TextFiled
                      () => CommonTextField(
                        hitText: 'New Password',
                        hitTextStyle: TextStyle(
                          fontFamily: FontFamilyData.sfUiBoldFont,
                          color: const Color(0xffB8B8B8),
                          fontSize: 16.sp,
                        ),
                        obscuringText: visibilityPasswordController.resetNewVisibility.value,
                        textEditingController: newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validator.validatePasswordLength,
                        suffixIcons: GestureDetector(
                          /// Visibility Password
                          onTap: () {
                            visibilityPasswordController.showResetNewVisibility();
                          },
                          child: Icon(
                            visibilityPasswordController.resetNewVisibility.value == true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Get.isDarkMode ? const Color(0xffB8B8B8) : const Color(0xff555555),
                            size: 27.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Obx(
                      /// Confirm Password TextFiled
                      () => CommonTextField(
                        hitText: 'Confirm Password',
                        hitTextStyle: TextStyle(
                          fontFamily: FontFamilyData.sfUiBoldFont,
                          color: const Color(0xffB8B8B8),
                          fontSize: 16.sp,
                        ),
                        textEditingController: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validator.validatePasswordLength,
                        obscuringText: visibilityPasswordController.resetConfirmVisibility.value,
                        suffixIcons: GestureDetector(
                          /// Visibility Password
                          onTap: () {
                            visibilityPasswordController.showResetConfirmVisibility();
                          },
                          child: Icon(
                            visibilityPasswordController.resetConfirmVisibility.value == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Get.isDarkMode ? const Color(0xffB8B8B8) : const Color(0xff555555),
                            size: 27.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 30.r),
          child: GestureDetector(
            /// Navigator Login Screen
            onTap: () {
              Get.close(3);
            },
            child: const ContainerComponent(
              textData: 'SUBMIT',
            ),
          ),
        ),
      ),
    );
  }
}
