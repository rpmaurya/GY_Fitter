import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/membership_ad_constants.dart';
import 'package:fitness_app/get/membership_controller.dart';
import 'package:fitness_app/screen/payment_screen/payment_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberShipAdScreen extends StatefulWidget {
  const MemberShipAdScreen({Key? key}) : super(key: key);

  @override
  State<MemberShipAdScreen> createState() => _MemberShipAdScreenState();
}

class _MemberShipAdScreenState extends State<MemberShipAdScreen> {
  /// Member ShipAd Controller
  MemberShipAdController memberShipAdController = Get.put(MemberShipAdController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height / 2.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    image: DecorationImage(
                      /// Add Cached NetworkImage Provider
                      image: CachedNetworkImageProvider(
                        MembershipAdConstants.imageAd,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Get.isDarkMode ? Colors.black12 : Colors.white10,
                          Get.isDarkMode ? Colors.black38 : Colors.white24,
                          Get.isDarkMode ? Colors.black : Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60.r,
                  left: 20.r,
                  child: GestureDetector(
                    onTap: () {
                      /// Navigator Home Screen
                      Get.back();
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      color: Colors.transparent,
                      child: Icon(
                        Icons.close,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30.r,
                  left: 30.r,
                  child: Text(
                    MembershipAdConstants.title,
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiBoldFont,
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: Column(
                children: [
                  Text(
                    MembershipAdConstants.description,
                    style: TextStyle(
                      fontFamily: FontFamilyData.sfUiRegularFont,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                itemCount: MembershipAdConstants.subscription.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    memberShipAdController.membershipAd(index);
                  },
                  child: Obx(() {
                    /// MemberShip Month Container
                    return Container(
                      padding: EdgeInsets.all(20.r),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: memberShipAdController.selectedIndex.value == index
                              ? const Color(0xff35C5F1)
                              : Get.isDarkMode
                                  ? const Color(0xff2F2F2F)
                                  : const Color(0xffE2E2E2),
                          width: 2.0.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MembershipAdConstants.subscription[index]['Subscription'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiSemiBold,
                                  color: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                MembershipAdConstants.subscription[index]['Description'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiRegularFont,
                                  color: Get.isDarkMode ? const Color(0xffE2E2E2) : const Color(0xff555555),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          memberShipAdController.selectedIndex.value == index
                              ? Icon(
                                  Icons.check_rounded,
                                  color: const Color(0xff35C5F1),
                                  size: 28.sp,
                                )
                              : const Text(''),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: GestureDetector(
                onTap: () {
                  /// Navigator Payment Add Card Screen
                  Get.to(
                    () => const PaymentAddCardScreen(),
                  );
                },
                child: ContainerComponent(
                  textData: MembershipAdConstants.buttonText,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              MembershipAdConstants.paymentMethod,
              style: TextStyle(
                fontFamily: FontFamilyData.sfUiRegularFont,
                color: Get.isDarkMode ? Colors.white : const Color(0xff555555),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
