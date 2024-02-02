import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/get/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final OnBoardingController controllerData = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return SafeAreaComponent(
      child: Scaffold(
        body: Stack(
          children: [
            /// Add PageView
            PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controllerData.pageController,
                onPageChanged: controllerData.selectedPage,
                itemCount: controllerData.onboardPage.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Theme.of(context).primaryColorDark,
                          width: double.infinity,
                          child: Image.asset(
                            controllerData.onboardPage[index].imageAsset!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.r,
                            vertical: 50.r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controllerData.onboardPage[index].title!,
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiBoldFont,
                                  fontSize: 26.sp,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                controllerData.onboardPage[index].description!,
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiRegularFont,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            Positioned(
              bottom: 50.r,
              left: 10.r,
              child: Row(
                children: List.generate(
                  controllerData.onboardPage.length,
                  (index) => Obx(() {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.r),
                      height: 6.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: controllerData.selectedPage.value == index
                            ? const Color(0xff35C5F1)
                            : Get.isDarkMode
                                ? const Color(0xff242424)
                                : const Color(0xffE2E2E2),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 30.r,
              right: 30.r,
              child: SizedBox(
                height: 60.h,
                width: 60.w,
                child: FloatingActionButton(
                  splashColor: Colors.white,
                  elevation: 0,
                  backgroundColor: const Color(0xff35C5F1),
                  onPressed: () {
                    /// Navigator Next Page
                    controllerData.forwardAction();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 23.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
