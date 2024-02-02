import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/visibility_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpDateEmailScreen extends StatelessWidget {
  UpDateEmailScreen({Key? key}) : super(key: key);
  final TextEditingController upDateEmailController = TextEditingController();
  final TextEditingController upDateNewEmailController = TextEditingController();
  final TextEditingController upDateEmailPasswordController = TextEditingController();
  final VisibilityPasswordController visibilityPasswordController = Get.put(VisibilityPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Update Email',
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
          margin: EdgeInsets.symmetric(horizontal: 30.r),
          child: Column(
            children: [
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
                textEditingController: upDateEmailController,
                validator: Validator.validateEmail,
              ),
              SizedBox(
                height: 40.h,
              ),

              /// New Email TextFiled
              CommonTextField(
                hitText: 'New Email',
                hitTextStyle: TextStyle(
                  fontFamily: FontFamilyData.sfUiBoldFont,
                  color: const Color(0xffB8B8B8),
                  fontSize: 16.sp,
                ),
                keyboardType: TextInputType.emailAddress,
                textEditingController: upDateNewEmailController,
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
                  obscuringText: visibilityPasswordController.upDatePasswordVisibility.value,
                  textEditingController: upDateEmailPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validator.validatePasswordLength,
                  suffixIcons: GestureDetector(
                    onTap: () {
                      /// Visibility Password
                      visibilityPasswordController.showUpDatePasswordVisibility();
                    },
                    child: Icon(
                      visibilityPasswordController.upDatePasswordVisibility.value == true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
                  textData: 'Update',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
