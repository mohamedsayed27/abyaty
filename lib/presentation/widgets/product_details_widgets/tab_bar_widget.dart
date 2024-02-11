import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsTabBarWidget extends StatelessWidget {
  final TabController tabController;

  const ProductDetailsTabBarWidget({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.authHintTextColor,
          width: 1.w,
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.symmetric(horizontal: 11.w),
        isScrollable: true,
        padding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        labelStyle: CustomThemes.whiteColoTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: CustomThemes.greyColor99TextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        labelColor: AppColors.whiteColor,
        unselectedLabelColor: AppColors.greyTextColor,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.secondaryColor,

        ),
        tabs: const [
          Tab(
            text: "Description",
          ),
          Tab(
            text: "Info",
          ),
          Tab(
            text: "Care Instruction",
          ),
          Tab(
            text: "Reviews",
          ),
        ],
        controller: tabController,
      ),
    );
  }
}

/*
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tab_bar_button.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  List<String> titlesList = [
    "Description",
    "Info",
    "Care Instruction",
    "Reviews",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.inActiveSliderColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          titlesList.length,
          (index) => TabBarButton(
            title: titlesList[index],
            isSelected: selectedIndex == index,
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

* */
class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = Colors.blue // Customize the color of the indicator
      ..style = PaintingStyle.fill;

    final Rect rect = Offset(
      offset.dx + 10, // Adjust the left padding of the indicator
      offset.dy + configuration.size!.height - 2, // Adjust the bottom padding
    ) & Size(configuration.size!.width - 20, 2); // Adjust the width and height

    canvas.drawRect(rect, paint);
  }
}