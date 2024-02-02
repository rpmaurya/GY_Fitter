import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermOfServicesScreen extends StatelessWidget {
  const TermOfServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Term of Services',
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {
            /// Navigator Setting Screen
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
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Term of Services',
                style: TextStyle(
                  fontFamily: FontFamilyData.sfUiBoldFont,
                  fontSize: 25.sp,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              /// Add All Detail Term of Services
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                padding: EdgeInsets.all(15.r),
                child: Text(
                  '''By installing or registering on the Gymer, you agree to be bound by these terms of use. These terms of use govern the access or views by you an individual from within India and its territories and possession of Applications, Websites, Content, Products and Services (“The Services”) made available in India and its territories and possessions by Gymer Fitness Solutions Private Limited and its subsidiaries and affiliates (collectively “Gymer”). Please read these terms carefully before accessing or using the services.
Last Updated on 14th June 2016.

DEFINITIONS:

“The Services” constitute a technology platform that enables users of Gymer’ Mobile Application or Websites provided as part of the services (each, an “application”) a service tool to book / schedule work-out sessions with our Partners (Gyms) of such services, including independent third party service providers under agreement with Gymer or its affiliates.

USER INFORMATION:

Gymer understands the importance of keeping the information about you that you entrust to us Confidential and secure (“Customer Information”). The information we collect may include your personal information, in other words information capable of identifying you as a particular individual, such as your name, phone number, email address, purchase preferences, credit / debit card information. We therefore make it our highest priority to ensure that we look after your information and use it responsibly. By using the service or by providing your information to us or our Partners (Gyms), you accept and consent to the collection, storage and processing of your information.
Gymer may collect your personal information (i) when you register an account (ii) when you purchase services on the Application (iii) when you participate in contests, competitions, questionnaires and surveys (iv) when you contact us (v) when you provide certain content to Gymer, for example testimonials and customer reviews (vi) from third party sources, for example credit checking agencies.
Gymer may use your personal information for (i) registering your account with Gymer (ii) for fulfilling orders (iii) for responding to your queries (iv) for improving your Gymer experience and providing you with information about our services, special offers and promotions.
Gymer will only share customer information with its carefully selected third party Partners for necessary business administration , customer delivery, marketing, operational and analytical purposes.
Gymer may also share customer information with third parties for the purpose of data analysis, quality assurance including fraud prevention.
Gymer uses leading technology and security measures (electronic, physical and procedural) to ensure the safety and confidentiality of customer information through collection, storage and disclosure. Such measures include maintaining a secure encryption based transmission system, intrusion detection and prevention software and virus software in respect of customer information.
When you use the App/service through your mobile device, and only if you have consented thereto, we will use your geo-location information, on a real time basis only. We use this information to allow you to view the Gyms around you. We may also use this real-time geo-location information to address user support, technical, or business issues that may arise in the course of your use of the App. Your mobile device informs you when geo-location is used by displaying the GPS arrow icon.

WEBSITE:

Should the application allow you to access information available on the Gymer website, such access will be governed by the Gymer website Terms of Use.

LICENSE:

Subject to your compliance with these Terms, Gymer grants you a limited, non-exclusive, non-sublicense, revocable, non-transferable license to: (i) access and use the Applications on your personal device solely in connection with your use of the Services; and (ii) access and use any content, information and related materials that may be made available through the Services, in each case solely for your personal, noncommercial use. Any rights not expressly granted herein are reserved by Gymer and Gymer’s licensor’s.
Neither these Terms nor your use of the Services convey or grant to you any rights: (i) in or related to the Services except for the limited license granted above; or (ii) to use or reference in any manner Gymer’s company names, logos, product and service names, trademarks or services marks or those of Gymer’s licensor’s. The Services and all rights therein are and shall remain Gymer’s property or the property of Gymer’s licensor’s.

CONDITIONS OF USE:

You may not: (i) remove any copyright, trademark or other proprietary notices from any portion of the Services; (ii) reproduce, modify, prepare derivative works based upon, distribute, license, lease, sell, resell, transfer, publicly display, publicly perform, transmit, stream, broadcast or otherwise exploit the Services except as expressly permitted by Gymer; (iii) decompile, reverse engineer or disassemble the Services (iv) link to, mirror or frame any portion of the Services; (v) cause or launch any programs or scripts for the purpose of scraping, indexing, surveying, or otherwise data mining any portion of the Services or unduly burdening or hindering the operation and/or functionality of any aspect of the Services; or (vi) attempt to gain unauthorized access to or impair any aspect of the Services or its related systems or networks.
You acknowledge that the terms of agreement with your respective mobile network provider (“Mobile Provider”) will continue to apply when using the Application / Service. As a result, you may be charged by the mobile provider for access to network connection services for the duration of the connection while accessing the Application or any such third party charges may arise. You accept the responsibility for any such charges that arise.
You are responsible for all activity that occurs under your Account, and you agree to maintain the security and secrecy of your Account username and password at all times. Unless otherwise permitted by Gymer in writing, you may only possess one Account.

THIRD PARTY SERVICES AND CONTENT:

The Services may be made available or accessed in connection with third party services and content (including advertising) that Gymer does not control. You acknowledge that different terms of use and privacy policies may apply to your use of such third party services and content. Gymer does not endorse such third party services and content and in no event shall Gymer be responsible or liable for any products or services of such third party providers.

AVAILABILITY:

Gymer will use reasonable measures to make the Application/Service available at all times. However, you acknowledge the Application/Service is provided over the internet and mobile networks and so the quality and the availability of the Application/Service may be affected by factors outside Gymer’s reasonable control.

LIMITATION OF LIABILITY:

In no event will Gymer be liable for any direct, indirect, special, punitive, exemplary or consequential damages of whatsoever kind arising out of your use or access to the Application/Service, including loss of profit or the like whether or not in the contemplation of the Parties, whether based on breach of contract, tort (including negligence), product liability or otherwise. Gymer is not liable to you for any damage or alteration to your mobile as a result of the installation or use of the Application/Service.

CODE OF CONDUCT:

Gymer expects its Users to respect and adhere to the “Code of Conduct” set-forth by itself and its Partners (Gyms). Entry to the Partner (Gym) premises is subject to the terms of use of the Partners (Gyms). Your work-out session may be cancelled or suspended if not complied with Partners (Gyms) terms of use of their facility.
You agree to comply with all applicable laws when using the Gymer and its Partners (Gyms) services. You will not in your use of the Services cause nuisance, annoyance, inconvenience, or property damage to the Partners (Gyms) or any other party. You will be asked to provide proof of identity to access or use the Services at the Partner (Gym) premises , and you agree that you may be denied access to or use of the Services if you refuse to provide proof of identity.
With the exception of personally identifiable information, the use of which is covered under our Privacy Policy, any material you send or post to the Application shall be considered non-proprietary and not confidential. Unless you advise to the contrary we will be free to copy, disclose, distribute, incorporate and otherwise use such material for any and all purposes. When using the Application you shall not post or send to or from this Application any material: (i) for which you have not obtained all necessary consents (ii) that is discriminatory, obscene, pornographic, defamatory, liable to incite racial hatred, in breach of confidentiality or privacy, which may cause annoyance or inconvenience to others, which encourages or constitutes conduct that would be deemed a criminal offence, give rise to a civil liability, or otherwise is contrary to the law in India.
We will fully co-operate with any law enforcement authorities or court order requiring us to disclose the identity or other details of any person posting material to our website/app in breach of terms of use.

PROMOTIONS:

From time to time Gymer will run promotional offers on its platforms in the form of vouchers and discounts that can be applied to user accounts. Promotions that are offered as valid for new customers only may not be applied to existing accounts or individuals who already have a Gymer account, whether active or dormant. In all cases promotional vouchers cannot be transferred to other users. Vouchers may only be redeemed against the purchase of services on the Gymer platforms and are not valid for use directly at the gym.

REFERRALS:

As a Gymer customer you can introduce your friends to Gymer and be rewarded with ‘Account credit’ if that customer completes the necessary steps. For each customer that uses your referral code when registering and then goes on to purchase and redeem one session you will be rewarded with ‘Referral credit points’. ‘Referral credit points’ can be redeemed to purchase work-out sessions. The ‘Referral credit points’ are not refundable or transferable and therefore cannot be withdrawn from your account. The friend that you refer will receive bonus credit points, the terms and condition of which are explained below under ‘Bonus Schemes’.

BONUS SCHEMES:

Gymer will run Bonus Schemes through which users may be rewarded with Bonus Credit, free passes, or additional discounts. Bonus Credit may not be exchanged for real money, and is valid for 30 days from date of issue. Bonus credit not used during its 30 day validity will expire and the value will be lost. Bonus Schemes may run from time to time or on an ongoing basis, and may vary in both the level of the reward offered and the terms of the specific scheme. In each instance the bonus scheme will state clearly the required steps to qualify, the reward offered and the eligibility criteria for the scheme.
(i) Registration Bonus – Registration Bonus schemes reward new users with free credit or a discount when they create an account. Registration Schemes are only applicable for new registrations, and may not be applied to users who have a pre-existing Gymer account.
(ii) Friend Referral Bonus – Registered Gymer users may refer friends. Referred customers receive Bonus Credit upon successful registration. Referring customers will receive Bonus Credit only when the Referred customers make their first purchase of a work-out session at a gym.

PAYMENT:

You understand that use of the Services may result in charges to you for the purchase of services you receive from our Partners. While you receive services obtained through your use of Gymer, we will facilitate your payment of the applicable Charges on behalf of the Partners. Payment of the Charges in such manner shall be considered the same as payment made directly by you to the Partners. Charges will be inclusive of applicable taxes required by law. Charges paid by you are final and non-refundable, unless otherwise determined by Gymer. All Charges are due on a pre-paid basis and payment will be facilitated by Gymer using the provided payment method, after which Gymer will send you a receipt via notifications.

CANCELLATIONS & REFUNDS:

Since Gymer allows bookings only for the day or next (48 hrs), you cannot cancel your bookings. However, you can reschedule the same by getting in touch with the Partner (Gym) directly. Rescheduling of your booking will be subject to Partners (Gyms) sole and absolute discretion. Unless expressly stated to the contrary herein, payments are nonrefundable and there are no refunds or credits for no-show or partially used work-out sessions. The amount and form of such refunds or discounts, and the decision to provide them, are at Gymer’s sole and absolute discretion. However, you can submit your requests / queries with regards to refunds by e-mailing us at support@gymer.in

EXCLUSION OF LIABILITY:

When you purchase a work-out session on Gymer platform for entrance to any of our Partner’s premises, Gymer, its officers, agents and/or consultants have no liability whatsoever in contract, tort, or otherwise for your acts, omissions or opinions and is in no way responsible for the behaviour or within any of the Partner’s premises. This means that Gymer is in no way liable or responsible for your health and safety at any time. Neither we nor our Partners (Gyms) shall be liable or responsible for any kind of loss or damage that may result to you or a third party as a result of your or their use of Partner Services (Gym Facilities). This exclusion shall include servicing or repair costs and, without limitation, any other direct, indirect or consequential loss, and whether in tort or contract or otherwise in connection the service. Nothing in these Terms shall exclude or limit liability for (i) death or personal injury caused by your negligence (ii) fraud; (iii) misrepresentation as to a fundamental matter; or (iv) any liability which cannot be excluded or limited under the law of the India (v) Gymer shall not be responsible for any delay or deficiency due to any force measure events such as natural disasters, acts of terrorism, civil labour strike and other strikes.

DISCLAIMER OF WARRANTIES:

To the maximum extent permitted by Law, and for the avoidance of doubt, save for Section 2 of The Supply of Goods and Services Act 1982, Gymer hereby disclaims all implied warranties with regard to the Application/Service. The Application and service are provided “as is” and “as available” without warranty of any kind.

INDEMNITY:

You agree to indemnify and hold Gymer and its officers, directors, employees, and agents harmless from any and all claims, demands, losses, liabilities, and expenses (including attorneys’ fees), arising out of or in connection with: (i) your use of the Services (ii) your breach or violation of any of these Terms; (iii) Gymer’s use of your User Content; or (iv) your violation of the rights of any third party, including Third Party Providers.

ARBITRATION:

All disputes, differences and/or claims arising out of the Contract shall be settled by Arbitration in accordance with the provisions of Arbitration and Conciliation Act,1996 or any statutory amendment thereof. The arbitration proceedings shall be held at Bangalore and shall be conducted in English Language. The award of the Arbitration shall be final and binding on you and Gymer.''',
                  style: TextStyle(
                    fontFamily: FontFamilyData.sfUiRegularFont,
                    fontSize: 18.sp,
                    color: Get.isDarkMode
                        ? const Color(0xffE2E2E2)
                        : const Color(0xff555555),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
