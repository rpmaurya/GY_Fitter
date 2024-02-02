import 'dart:io';

import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/image_path_constants.dart';
import 'package:fitness_app/get/visibility_password_controller.dart';
import 'package:fitness_app/screen/bottom_bar_screen/bottom_navigation_bar_screen.dart';
import 'package:fitness_app/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:fitness_app/screen/signup_screen/page_view_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailFields extends StatelessWidget {
  EmailFields({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Visibility Password Controller
  final VisibilityPasswordController visibilityPasswordController = Get.put(VisibilityPasswordController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            /// Email TextFiled
            CommonTextField(
              hitText: 'Email',
              hitTextStyle: TextStyle(
                fontFamily: FontFamilyData.sfUiBoldFont,
                color: const Color(0xffB8B8B8),
                fontSize: 16.sp,
              ),
              keyboardType: TextInputType.emailAddress,
              textEditingController: emailController,
              validator: Validator.validateEmail,
            ),
            SizedBox(
              height: 40.h,
            ),
            Obx(
              /// Password TextFiled
              () => CommonTextField(
                hitText: 'Password',
                hitTextStyle: TextStyle(
                  fontFamily: FontFamilyData.sfUiBoldFont,
                  color: const Color(0xffB8B8B8),
                  fontSize: 16.sp,
                ),
                textEditingController: passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: Validator.validatePasswordLength,
                obscuringText: visibilityPasswordController.selectedLoginVisibility.value,
                suffixIcons: GestureDetector(
                  /// Visibility Password
                  onTap: () {
                    visibilityPasswordController.showLoginVisibility();
                  },
                  child: Icon(
                    visibilityPasswordController.selectedLoginVisibility.value == true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Get.isDarkMode ? const Color(0xffB8B8B8) : const Color(0xff555555),
                    size: 27.w,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                /// Navigator Forgot Password Screen
                onTap: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiRegularFont,
                    color: const Color(0xff35C5F1),
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                /// Add SharedPreferences
                storeOnboardInfo();

                /// Navigator Bottom Navigation Bar Screen
                Get.offAll(() => const BottomNavigationBarScreen());
              },
              child: const ContainerComponent(
                textData: 'LOGIN',
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 270.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Divider(
                      color: Get.isDarkMode ? const Color(0xff555555) : const Color(0xffE2E2E2),
                      thickness: 2.w,
                      endIndent: 13.w,
                    ),
                  ),
                  Text(
                    'or login with',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiRegularFont,
                      color: Get.isDarkMode ? const Color(0xff555555) : const Color(0xffB8B8B8),
                      fontSize: 14.sp,
                    ),
                  ),
                  Flexible(
                    child: Divider(
                      color: Get.isDarkMode ? const Color(0xff555555) : const Color(0xffE2E2E2),
                      thickness: 2.w,
                      indent: 13.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Google Login Button
                OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    fixedSize: Size(80.w, 80.h),
                  ),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagePath.google),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),

                /// FaceBook or Apple Login Button
                OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    fixedSize: Size(80.w, 80.h),
                  ),
                  child: Container(
                    height: Platform.isAndroid ? 47.h : 40.h,
                    width: Platform.isAndroid ? 47.w : 32.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            Platform.isAndroid ? AssetImage(ImagePath.faceBook) : AssetImage(Get.isDarkMode ? ImagePath.darkApple : ImagePath.apple),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 58.h,
            ),
            GestureDetector(
              onTap: () {
                /// Navigator SignUp OnBoarding Page
                Get.to(() => SignUpOnBoardingScreen());
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account?',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiRegularFont,
                        color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: ' Signup',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiRegularFont,
                        color: const Color(0xff35C5F1),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  /// SharedPreferences Function
  storeOnboardInfo() async {
    bool isViewed = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoard', isViewed);
  }
}
