import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/visibility_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController createRePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Visibility Password Controller
  final VisibilityPasswordController visibilityPasswordController = Get.put(VisibilityPasswordController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Change Password',
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
            ),
          ),
          leading: InkWell(
            borderRadius: BorderRadius.circular(50.r),
            onTap: () {
              /// Navigator Setting Screen
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 50.r),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Old Password TextFiled
                  CommonTextField(
                    hitText: 'Old Password',
                    hitTextStyle: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      color: const Color(0xffB8B8B8),
                      fontSize: 16.sp,
                    ),
                    keyboardType: TextInputType.text,
                    textEditingController: oldPasswordController,
                    validator: Validator.validatePasswordLength,
                  ),
                  SizedBox(
                    height: 40.h,
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
                      obscuringText: visibilityPasswordController.newPasswordVisibility.value,
                      textEditingController: newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validator.validatePasswordLength,
                      suffixIcons: GestureDetector(
                        onTap: () {
                          /// visibility Password
                          visibilityPasswordController.showNewPasswordVisibility();
                        },
                        child: Icon(
                          visibilityPasswordController.newPasswordVisibility.value == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
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
                      textEditingController: createRePasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validator.validatePasswordLength,
                      obscuringText: visibilityPasswordController.confirmPasswordVisibility.value,
                      suffixIcons: GestureDetector(
                        onTap: () {
                          /// visibility Password
                          visibilityPasswordController.showConfirmPasswordVisibility();
                        },
                        child: Icon(
                          visibilityPasswordController.confirmPasswordVisibility.value == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Get.isDarkMode ? const Color(0xffB8B8B8) : const Color(0xff555555),
                          size: 27.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      /// Navigator Setting Screen
                      Get.back();
                    },
                    child: const ContainerComponent(
                      textData: 'Continue',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
