import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/image_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginDesignScreen extends StatelessWidget {
  const LoginDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeAreaComponent(
      child: SizedBox(
        height: size.height / 2.20,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              ImagePath.loginBlue,
              fit: BoxFit.fill,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30.r),
              margin: EdgeInsets.only(
                bottom: 60.r,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                image: DecorationImage(
                  image: AssetImage(
                    Get.isDarkMode ? ImagePath.darkLoginBack : ImagePath.loginBack,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                'Log in',
                style: TextStyle(
                    fontFamily: FontFamilyData.sfUiHeavyFont, color: Get.isDarkMode ? const Color(0xff101010) : Colors.white, fontSize: 36.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
