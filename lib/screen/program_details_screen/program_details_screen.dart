import 'package:fitness_app/component/cached_network_image_component.dart';
import 'package:fitness_app/constans/font_family_constants.dart';
import 'package:fitness_app/constans/program_details_constants.dart';
import 'package:fitness_app/screen/program_details_screen/overview_tab_screen.dart';
import 'package:fitness_app/screen/program_details_screen/schedule_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProgramDetailsScreen extends StatefulWidget {
  const ProgramDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ProgramDetailsConstans.titleName,
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
              /// Navigator Select Schedule Screen
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),

                        /// Cached NetworkImage Component
                        child: CachedNetworkImageComponent(
                          imageUri: ProgramDetailsConstans.imageProgramDetails,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      ProgramDetailsConstans.bodyWorkoutTitle,
                      style: TextStyle(
                          fontFamily: FontFamilyData.sfUiBoldFont, fontSize: 20.sp, color: Get.isDarkMode ? Colors.white : const Color(0xff101010)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        ProgramDetailsConstans.bodyWorkoutDetail.length,
                        (index) => Container(
                          height: 90.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: Get.isDarkMode ? const Color(0xff1A1A1A) : const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ProgramDetailsConstans.bodyWorkoutDetail[index]['title'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiBoldFont,
                                  color: const Color(0xff35C5F1),
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                ProgramDetailsConstans.bodyWorkoutDetail[index]['detail'],
                                style: TextStyle(
                                  fontFamily: FontFamilyData.sfUiSemiMedium,
                                  color: Get.isDarkMode ? Colors.white : const Color(0xff2F2F2F),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).toList(),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),

              ///  Add TabBar
              TabBar(
                controller: tabController,
                onTap: (index) {
                  setState(() {});
                },
                tabs: [
                  Tab(
                    child: Text(
                      ProgramDetailsConstans.titleOverview,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      ProgramDetailsConstans.titleSchedule,
                      style: TextStyle(
                        fontFamily: FontFamilyData.sfUiBoldFont,
                        fontSize: 18.sp,
                      ),
                    ),
                  )
                ],
                indicatorColor: const Color(0xff35C5F1),
                indicatorWeight: 3.w,
                labelColor: Get.isDarkMode ? Colors.white : const Color(0xff101010),
                unselectedLabelColor: Get.isDarkMode ? const Color(0xffB8B8B8) : const Color(0xff555555),
              ),
              SizedBox(
                height: 40.h,
              ),

              /// TabBarView
              SizedBox(
                height: tabController!.index == 0 ? size.height / 2.4 : size.height / 0.9,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [
                    OverviewDetailScreen(),
                    ScheduleDetailScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
