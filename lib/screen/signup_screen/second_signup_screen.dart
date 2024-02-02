import 'package:fitness_app/component/text_filed_page.dart';
import 'package:fitness_app/component/validator_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/dropdown_controller.dart';
import 'package:fitness_app/get/signup_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecondSignUpScreen extends StatefulWidget {
  const SecondSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SecondSignUpScreen> createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  SignUpDateController signUpDateController = SignUpDateController();
  TextEditingController fullNameController = TextEditingController();

  /// DropDown Controller
  DropDownController dropDownController = DropDownController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 100.r),
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

              /// Full Name TextFiled
              CommonTextField(
                hitText: 'Full Name',
                hitTextStyle: TextStyle(
                  fontFamily: FontFamilyData.sfUiBoldFont,
                  color: const Color(0xffB8B8B8),
                  fontSize: 16.sp,
                ),
                textEditingController: fullNameController,
                keyboardType: TextInputType.visiblePassword,
                validator: Validator.validateName,
              ),
              SizedBox(
                height: 40.h,
              ),
              Obx(() {
                /// Date of Birth TextFiled
                return CommonTextField(
                  hitText: 'Date of Birth',
                  hitTextStyle: TextStyle(
                    fontFamily: FontFamilyData.sfUiBoldFont,
                    color: const Color(0xffB8B8B8),
                    fontSize: 16.sp,
                  ),
                  textEditingController: signUpDateController.dateController.value,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validator.validateName,
                  onlyRead: true,
                  suffixIcons: GestureDetector(
                    /// Show DatePicker
                    onTap: () {
                      signUpDateController.chooseDate();
                    },
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 26.sp,
                      color: Get.isDarkMode ? const Color(0xffB8B8B8) : const Color(0xff555555),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 40.h,
              ),
              Obx(
                /// Gender DropdownButtonFormField
                () => DropdownButtonFormField<dynamic>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 30.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      hintStyle: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        color: const Color(0xffB8B8B8),
                        fontSize: 16.sp,
                      ),
                    ),
                    onChanged: (selectedValue) {
                      dropDownController.itemGender(selectedValue);
                    },
                    value: dropDownController.selectedGender.value == "" ? null : dropDownController.selectedGender.value,
                    items: [
                      for (var data in dropDownController.dropdownGender)
                        DropdownMenuItem(
                          value: data,
                          child: Text(
                            data,
                          ),
                        )
                    ]),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Obx(
                    () => Expanded(
                      /// Weight DropdownButtonFormField
                      child: DropdownButtonFormField<dynamic>(
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 30.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Weight',
                            hintStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiBoldFont,
                              color: const Color(0xffB8B8B8),
                              fontSize: 16.sp,
                            ),
                          ),
                          onChanged: (selectedValue) {
                            dropDownController.itemWeight(selectedValue);
                          },
                          value: dropDownController.selectedWeight.value == "" ? null : dropDownController.selectedWeight.value,
                          items: [
                            for (var data in dropDownController.dropdownWeight)
                              DropdownMenuItem(
                                value: data,
                                child: Text(
                                  data,
                                ),
                              )
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  Obx(
                    () => Expanded(
                      /// Height DropdownButtonFormField
                      child: DropdownButtonFormField<dynamic>(
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 30.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Height',
                          hintStyle: TextStyle(
                            fontFamily: FontFamilyData.sfUiBoldFont,
                            color: const Color(0xffB8B8B8),
                            fontSize: 16.sp,
                          ),
                        ),
                        onChanged: (selectedValue) {
                          dropDownController.itemHeight(selectedValue);
                        },
                        value: dropDownController.selectedHeight.value == "" ? null : dropDownController.selectedHeight.value,
                        items: [
                          for (var data in dropDownController.dropdownHeight)
                            DropdownMenuItem(
                              value: data,
                              child: Text(
                                data,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
