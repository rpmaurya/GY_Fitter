import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/payment_screen/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

class PaymentVerifyScreen extends StatelessWidget {
  final String? cardHolderName;
  final String? expiredDate;

  PaymentVerifyScreen({Key? key, this.cardHolderName, this.expiredDate}) : super(key: key);

  /// Otp Field Controller
  final OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        leading: GestureDetector(
          /// Navigator Payment Card Screen
          onTap: () {
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
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30.r),
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: const CachedNetworkImageComponent(
                      imageUri:
                          'https://images.moneycontrol.com/static-mcnews/2017/12/Rubique_Digital-payment_cover.jpg?impolicy=website&width=770&height=431')),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Amount',
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiHeavyFont,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '\$500',
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiSemiMedium,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Card Holder',
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiHeavyFont,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                cardHolderName.toString(),
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiSemiMedium,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Expired Date',
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiHeavyFont,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                expiredDate.toString(),
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiSemiMedium,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Get Otp',
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiHeavyFont,
                    fontSize: 22.sp,
                  ),
                ),
              ),

              /// Add OTP TextField
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300.w,
                  child: OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      enabledBorderColor: Get.isDarkMode ? Colors.white : Colors.black,
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
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                /// Navigator Payment Success Screen
                onTap: () {
                  Get.to(() => const PaymentSuccessScreen());
                },
                child: const ContainerComponent(
                  textData: 'Payment',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
