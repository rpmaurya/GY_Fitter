import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/bottom_bar_screen/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              /// Add Payment Successful Lottie
              Lottie.asset('asset/image/successful-payment.json', repeat: false),
              Text(
                '  Payment\nSuccessful',
                style: TextStyle(fontFamily: FontFamilyData.sfUiHeavyFont, fontSize: 25.sp, color: Colors.green),
              ),
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onTap: () {
                  ///  Navigator BottomNavigation Bar Screen
                  Get.offAll(() => const BottomNavigationBarScreen());
                },
                child: const ContainerComponent(
                  textData: 'Go to Home',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
