import 'package:fitness_app/component/container_class.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/screen/program_details_screen/program_details_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectScheduleScreen extends StatefulWidget {
  const SelectScheduleScreen({Key? key}) : super(key: key);

  @override
  State<SelectScheduleScreen> createState() => _SelectScheduleScreenState();
}

class _SelectScheduleScreenState extends State<SelectScheduleScreen> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Schedule',
          style: TextStyle(
            fontFamily: FontFamilyData.sfUiBoldFont,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {
            /// Navigator Traning Screen
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
          children: [
            /// Add TableCalendar
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Get.isDarkMode ? const Color(0xff2F2F2F) : const Color(0xffE2E2E2),
                ),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2000),
                lastDay: DateTime.utc(2040),
                headerStyle: HeaderStyle(
                  leftChevronIcon: Icon(Icons.arrow_back_ios_new, color: Get.isDarkMode ? Colors.white : Colors.black, size: 22.sp),
                  rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Get.isDarkMode ? Colors.white : Colors.black, size: 22.sp),
                  formatButtonVisible: false,
                  headerPadding: EdgeInsets.symmetric(horizontal: 50.r),
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontFamily: FontFamilyData.sfUiBoldFont,
                    fontSize: 18.sp,
                  ),
                ),
                focusedDay: focusedDay,
                rangeStartDay: rangeStart,
                rangeEndDay: rangeEnd,
                rangeSelectionMode: _rangeSelectionMode,
                onRangeSelected: (start, end, focusedDay) {
                  setState(() {
                    selectedDay = null;
                    focusedDay = focusedDay;
                    rangeStart = start;
                    rangeEnd = end;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  });
                  if (kDebugMode) {
                    print('focusedDay $focusedDay');
                  }
                  if (kDebugMode) {
                    print('rangeStart $rangeStart');
                  }
                  if (kDebugMode) {
                    print('rangeEnd $rangeEnd');
                  }
                  if (kDebugMode) {
                    print('rangeSelectionMode $_rangeSelectionMode');
                  }
                },
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontFamily: FontFamilyData.sfUiSemiMedium,
                    fontSize: 14.sp,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontFamily: FontFamilyData.sfUiSemiMedium,
                    fontSize: 14.sp,
                  ),
                  rangeHighlightColor: Get.isDarkMode ? const Color(0xff18343d) : const Color(0xffd7f3fc),
                  rangeStartDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(10),
                    color: Color(0xff35C5F1),
                  ),
                  rangeEndTextStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: FontFamilyData.sfUiSemiMedium,
                    fontSize: 14.sp,
                  ),
                  rangeStartTextStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: FontFamilyData.sfUiSemiMedium,
                    fontSize: 14.sp,
                  ),
                  rangeEndDecoration: const BoxDecoration(
                    color: Color(0xff35C5F1),
                    // borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                  ),
                ),
                onPageChanged: (focusDay) {
                  focusedDay = focusDay;
                  if (kDebugMode) {
                    print('_focusedDay $focusedDay');
                  }
                },
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: GestureDetector(
                onTap: () {
                  /// Navigator Program Details Screen
                  Get.to(() => const ProgramDetailsScreen());
                },
                child: const ContainerComponent(
                  textData: 'ADD PROGRAM',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
