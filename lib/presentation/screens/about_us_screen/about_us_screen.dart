import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/home_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/constants/dummy_data.dart';
import '../../widgets/about_us_widgets/about_us_component.dart';
import '../../widgets/about_us_widgets/our_creative_team.dart';
import '../../widgets/about_us_widgets/section_title_widget.dart';
import '../../widgets/about_us_widgets/what_we_do_component.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: const CustomAppBar(
          title: "About Us",
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 212.h,
                width: double.infinity,
                color: AppColors.favoriteButtonBackgroundGreyColoColor,
                child: PageView.builder(
                  controller: controller,
                  itemCount: DummyData.dummyBlogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      DummyData.dummyBlogs[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned.fill(
                bottom: 24.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: DummyData.dummyBlogs.length,
                    effect: ExpandingDotsEffect(
                      spacing: 4.w,
                      radius: 4.r,
                      dotHeight: 6.h,
                      dotWidth: 6.w,
                      expansionFactor: 2,
                      paintStyle: PaintingStyle.fill,
                      dotColor: AppColors.whiteColor,
                      activeDotColor: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 24,
          ),
          const AboutUsComponent(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDividerWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          const WhatWeDoComponent(),
          const CustomSizedBox(
            height: 24,
          ),
          const CustomDividerWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          OurCreativeTeamComponent(),
        ],
      ),
    );
  }
}
