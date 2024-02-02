import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/forgot_password_screen/verification_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      /// Navigator Bottom NavigationBar Screen
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
                      height: 30.h,
                    ),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 26.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Enter the email associated with your account and we’ll send you a verification code.',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiRegularFont,
                        fontSize: 16.sp,
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
                      textEditingController: emailController,
                      validator: Validator.validateEmail,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    GestureDetector(
                      /// Navigator Verification Code Screen
                      onTap: () {
                        Get.to(() => const VerificationCodeScreen());
                      },
                      child: const ContainerComponent(
                        textData: 'SEND',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
