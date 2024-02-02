import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/payment_screen/payment_verify_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentAddCardScreen extends StatefulWidget {
  const PaymentAddCardScreen({Key? key}) : super(key: key);

  @override
  State<PaymentAddCardScreen> createState() => _PaymentAddCardScreenState();
}

class _PaymentAddCardScreenState extends State<PaymentAddCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            'Add Card',
            style: TextStyle(
              fontFamily: FontFamilyData.sfUiBoldFont,
              fontSize: 20.sp,
            ),
          ),
          leading: InkWell(
            borderRadius: BorderRadius.circular(50.r),
            onTap: () {
              /// Navigator MemberShip Ad Screen
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              /// Add Card Widget
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (creditCardBrand) {},
                isHolderNameVisible: true,
                textStyle: TextStyle(fontFamily: FontFamilyData.sfUiBoldFont, fontSize: 15.sp, color: Colors.white),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    color: Theme.of(context).primaryColorDark,
                    child: Column(
                      children: [
                        CreditCardForm(
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          onCreditCardModelChange: onCreditCardModelChange,
                          themeColor: Colors.blue,
                          formKey: formKey,
                          textColor: Get.isDarkMode ? Colors.white : Colors.black,

                          /// Card Number TextField
                          cardNumberDecoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            labelText: 'Number',
                            labelStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiBoldFont,
                              color: const Color(0xffB8B8B8),
                              fontSize: 16.sp,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: FontFamilyData.sfUiRegularFont, fontSize: 16.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                            hintText: 'xxxx xxxx xxxx xxxx',
                          ),

                          /// Expiry Date TextField
                          expiryDateDecoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiBoldFont,
                              color: const Color(0xffB8B8B8),
                              fontSize: 16.sp,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: FontFamilyData.sfUiRegularFont, fontSize: 16.sp, color: Get.isDarkMode ? Colors.white : Colors.black),
                            labelText: 'Expired Date',
                            hintText: 'MM/YY',
                          ),

                          /// Cvv Code TextField
                          cvvCodeDecoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiBoldFont,
                              color: const Color(0xffB8B8B8),
                              fontSize: 16.sp,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: FontFamilyData.sfUiRegularFont,
                              fontSize: 16.sp,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            labelText: 'CVV',
                            hintText: 'xxx',
                          ),

                          /// Card Holder TextField
                          cardHolderDecoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: FontFamilyData.sfUiBoldFont,
                                color: const Color(0xffB8B8B8),
                                fontSize: 16.sp,
                              ),
                              labelText: 'Card Holder',
                              hintText: 'Card Holder Name',
                              hintStyle: TextStyle(
                                fontFamily: FontFamilyData.sfUiRegularFont,
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              /// Navigator Payment Screen
                              Get.to(
                                () => PaymentVerifyScreen(
                                  cardHolderName: cardHolderName,
                                  expiredDate: expiryDate,
                                ),
                              );
                            } else {
                              if (kDebugMode) {
                                print('inValid');
                              }
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 50.r,
                              horizontal: 20.r,
                            ),
                            child: const ContainerComponent(
                              textData: 'Add Card',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Card Model Change Function
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
