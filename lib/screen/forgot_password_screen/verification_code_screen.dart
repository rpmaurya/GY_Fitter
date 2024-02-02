import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/forgot_password_screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Otp Field Controller
  OtpFieldController otpController = OtpFieldController();

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
              color: Theme.of(context).primaryColorDark,
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      /// Navigator Forgot Password Screen
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
                      'Verification Code',
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 26.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Enter verification code that has been send to your email.',
                      style: TextStyle(fontFamily: FontFamilyData.sfUiRegularFont, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    /// OTP Text Field
                    OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                        enabledBorderColor: Get.isDarkMode ? const Color(0xff2F2F2F) : const Color(0xffE2E2E2),
                      ),
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      keyboardType: TextInputType.number,
                      controller: otpController,
                      length: 6,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiSemiBold,
                        fontSize: 26.sp,
                      ),
                      onChanged: (pin) {},
                      onCompleted: (pin) {},
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Didn’t receive a code?',
                              style: TextStyle(
                                fontFamily: FontFamilyData.sfUiRegularFont,
                                color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' Resend Code',
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
                      height: 40.h,
                    ),
                    GestureDetector(
                      ///Navigator Reset Password Screen
                      onTap: () {
                        Get.to(() => const ResetPasswordScreen());
                      },
                      child: const ContainerComponent(
                        textData: 'VERIFY',
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
