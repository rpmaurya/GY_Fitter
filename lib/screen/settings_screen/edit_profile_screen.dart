import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/visibility_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
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
            'Edit Profile',
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
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    color: Theme.of(context).primaryColorDark,
                    margin: EdgeInsets.symmetric(vertical: 20.r),
                    child: CircleAvatar(
                      /// Cached NetworkImage Provider
                      backgroundImage: const CachedNetworkImageProvider(
                          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                      radius: 75.r,
                    ),
                  ),
                  Text(
                    'David',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      fontSize: 20.sp,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Julio',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiSemiBold,
                      fontSize: 16.sp,
                      color: Get.isDarkMode ? const Color(0xffE2E2E2) : const Color(0xff555555),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.r),
                    child: Column(
                      children: [
                        /// First Name TextFiled
                        CommonTextField(
                          hitText: 'First Name',
                          hitTextStyle: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            color: const Color(0xffB8B8B8),
                            fontSize: 16.sp,
                          ),
                          keyboardType: TextInputType.name,
                          textEditingController: firstNameController,
                          validator: Validator.validateName,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),

                        /// Last Name TextFiled
                        CommonTextField(
                          hitText: 'Last Name',
                          hitTextStyle: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            color: const Color(0xffB8B8B8),
                            fontSize: 16.sp,
                          ),
                          keyboardType: TextInputType.name,
                          textEditingController: lastNameController,
                          validator: Validator.validateName,
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
                            obscuringText: visibilityPasswordController.profilePasswordVisibility.value,
                            textEditingController: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: Validator.validatePasswordLength,
                            suffixIcons: GestureDetector(
                              onTap: () {
                                /// Visibility Password
                                visibilityPasswordController.showProfilePasswordVisibility();
                              },
                              child: Icon(
                                visibilityPasswordController.profilePasswordVisibility.value == true
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

                        /// Weight Password TextFiled
                        CommonTextField(
                          hitText: 'Weight',
                          hitTextStyle: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            color: const Color(0xffB8B8B8),
                            fontSize: 16.sp,
                          ),
                          keyboardType: TextInputType.number,
                          textEditingController: weightController,
                          validator: Validator.validateId,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),

                        /// Height Password TextFiled
                        CommonTextField(
                          hitText: 'Height',
                          hitTextStyle: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            color: const Color(0xffB8B8B8),
                            fontSize: 16.sp,
                          ),
                          keyboardType: TextInputType.number,
                          textEditingController: heightController,
                          validator: Validator.validateId,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),

                        /// Age Password TextFiled
                        CommonTextField(
                          hitText: 'Age',
                          hitTextStyle: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            color: const Color(0xffB8B8B8),
                            fontSize: 16.sp,
                          ),
                          keyboardType: TextInputType.number,
                          textEditingController: ageController,
                          validator: Validator.validateId,
                          maxLength: 2,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        GestureDetector(
                          /// Navigator Setting Screen
                          onTap: () {
                            Get.back();
                          },
                          child: const ContainerComponent(
                            textData: 'Continue',
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
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
