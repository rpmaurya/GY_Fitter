import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/image_path_constants.dart';
import 'package:fitness_app/screen/bottom_bar_screen/bottom_navigation_bar_screen.dart';
import 'package:fitness_app/screen/starting_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getOnboardInfo();
  }

  getOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isViewed = prefs.getBool('onBoard');
    if (isViewed == false) {
      /// Navigator Bottom NavigationBar Screen
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationBarScreen(),
          ),
        ),
      );
    } else {
      /// Navigator OnBoardingPage Screen
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 140.w,
              child: Image.asset(ImagePath.logo),
            ),
            SizedBox(
              height: 43.h,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'GY',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiHeavyFont,
                      color: Get.isDarkMode
                          ? Colors.white
                          : const Color(0xff101010),
                      fontSize: 28.sp,
                    ),
                  ),
                  TextSpan(
                    text: 'Fitter',
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiHeavyFont,
                      color: const Color(0xff35C5F1),
                      fontSize: 28.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
