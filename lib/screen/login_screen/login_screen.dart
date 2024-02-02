import 'package:fitness_app/component/safe_area_component.dart';
import 'package:fitness_app/screen/login_screen/email_part.dart';
import 'package:fitness_app/screen/login_screen/up_side_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                /// UpSide Design Screen
                const LoginDesignScreen(),
                SizedBox(
                  height: 16.h,
                ),

                /// Email Part Screen
                EmailFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
