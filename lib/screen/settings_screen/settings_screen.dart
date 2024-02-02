import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/component/rating_box_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/setting_constants.dart';
import 'package:fitness_app/screen/login_screen/login_screen.dart';
import 'package:fitness_app/screen/settings_screen/change_password_screen.dart';
import 'package:fitness_app/screen/settings_screen/edit_profile_screen.dart';
import 'package:fitness_app/screen/settings_screen/term_of_services_screen.dart';
import 'package:fitness_app/screen/settings_screen/update_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          SettingConstants.titleName,
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {
            /// Navigator Profile Screen
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SettingConstants.titleAccountInfo,
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      fontSize: 18.sp,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  /// Account info Container
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: SettingConstants.accountInfoList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                /// Navigator EditProfile Screen
                                if (index == 0) {
                                  Get.to(() => EditProfileScreen());
                                }

                                /// Navigator ChangePassword Screen
                                if (index == 1) {
                                  Get.to(() => ChangePasswordScreen());
                                }

                                /// Navigator UpDateEmail Screen
                                if (index == 2) {
                                  Get.to(() => UpDateEmailScreen());
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(20.r),
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      SettingConstants.accountInfoList[index],
                                      style: TextStyle(
                                        fontFamily: FontFamilyData.sfUiRegularFont,
                                        fontSize: 18.sp,
                                        color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 22.sp,
                                      color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            index != SettingConstants.accountInfoList.length - 1
                                ? Divider(
                                    color: Get.isDarkMode ? const Color(0xff2F2F2F) : const Color(0xffE2E2E2),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SettingConstants.titleHelpSupport,
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      fontSize: 18.sp,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  /// Help And Support Container
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Get.isDarkMode ? const Color(0xff1A1A1A) : const Color(0xffF5F5F5),
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: SettingConstants.helpSupportList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                /// Navigator TermOfServices Screen
                                if (index == 0) {
                                  Get.to(() => const TermOfServicesScreen());
                                }

                                /// Navigator RatingBox
                                if (index == 2) {
                                  RatingBox.ratingDialogData();
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.all(20.r),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      SettingConstants.helpSupportList[index],
                                      style: TextStyle(
                                        fontFamily: FontFamilyData.sfUiRegularFont,
                                        fontSize: 18.sp,
                                        color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 22.sp,
                                      color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            index != SettingConstants.helpSupportList.length - 1
                                ? Divider(
                                    color: Get.isDarkMode ? const Color(0xff2F2F2F) : const Color(0xffE2E2E2),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: GestureDetector(
                onTap: () {
                  /// Navigator Login Screen
                  Get.offAll(() => const LoginScreen());
                },
                child: const ContainerComponent(
                  textData: 'LOGOUT',
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
