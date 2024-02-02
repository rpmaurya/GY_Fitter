import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/visibility_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThirdSignupScreen extends StatefulWidget {
  const ThirdSignupScreen({Key? key}) : super(key: key);

  @override
  State<ThirdSignupScreen> createState() => _ThirdSignupScreenState();
}

class _ThirdSignupScreenState extends State<ThirdSignupScreen> {
  TextEditingController createEmailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController createRePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Visibility Password Controller
  VisibilityPasswordController visibilityPasswordController = Get.put(VisibilityPasswordController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 100.r),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Details',
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiBoldFont,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),

                /// Email TextFiled
                CommonTextField(
                  hitText: 'Email',
                  hitTextStyle: TextStyle(
                    fontFamily: FontFamilyData.sfUiBoldFont,
                    color: const Color(0xffB8B8B8),
                    fontSize: 16.sp,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: createEmailController,
                  validator: Validator.validateEmail,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Obx(
                  /// Create Password TextFiled
                  () => CommonTextField(
                    hitText: 'Create Password',
                    hitTextStyle: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      color: const Color(0xffB8B8B8),
                      fontSize: 16.sp,
                    ),
                    obscuringText: visibilityPasswordController.signupCreateVisibility.value,
                    textEditingController: createPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validator.validatePasswordLength,
                    suffixIcons: GestureDetector(
                      onTap: () {
                        /// Visibility Password
                        visibilityPasswordController.showSignupCreateVisibility();
                      },
                      child: Icon(
                        visibilityPasswordController.signupCreateVisibility.value == true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
                    obscuringText: visibilityPasswordController.signupConfirmVisibility.value,
                    suffixIcons: GestureDetector(
                      /// Visibility Password
                      onTap: () {
                        visibilityPasswordController.showSignupConfirmVisibility();
                      },
                      child: Icon(
                        visibilityPasswordController.signupConfirmVisibility.value == true
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
    );
  }
}
