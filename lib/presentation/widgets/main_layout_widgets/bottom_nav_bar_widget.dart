import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../buisness_logic/main_layout_cubit/main_layout_cubit.dart';
import '../../buisness_logic/main_layout_cubit/main_layout_state.dart';
import '../../screens/shop_screen/category_details_screen.dart';
import 'bottom_nav_bar_icon.dart';

class BottomNavBarWidget extends StatelessWidget {

  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 16.h, bottom: 24.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4.h),
            blurRadius: 16.r,
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: BlocConsumer<MainLayoutCubit, MainLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = MainLayoutCubit.get(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBarIcon(
                label: "Home",
                iconPath: SvgPath.homeNavIcon,
                onTap: () {
                  cubit.changeCurrentIndex(0);
                },
                activeIconPath: SvgPath.homeBoldNavIcon,
                isSelected: cubit.currentIndex == 0,
              ),
              BottomNavBarIcon(
                label: "Shop",
                iconPath: SvgPath.shopNavIcon,
                onTap: () {

                  cubit.changeCurrentIndex(1);
                },
                activeIconPath: SvgPath.shopBoldNavIcon,
                isSelected: cubit.currentIndex == 1,
              ),
              BottomNavBarIcon(
                label: "Cart",
                iconPath: SvgPath.cartNavIcon,
                onTap: () {
                  Navigator.pushNamed(context, ScreenName.cartScreen);
                },
                activeIconPath: SvgPath.cartNavIcon,
                isSelected: cubit.currentIndex == 2,
              ),
              BottomNavBarIcon(
                label: "Home",
                iconPath: SvgPath.favNavIcon,
                onTap: () {

                  cubit.changeCurrentIndex(3);
                },
                activeIconPath: SvgPath.favBoldNavIcon,
                isSelected: cubit.currentIndex == 3,
              ),
              BottomNavBarIcon(
                label: "More",
                iconPath: SvgPath.moreNavIcon,
                onTap: () {
                  cubit.changeCurrentIndex(4);
                },
                activeIconPath: SvgPath.moreBoldNavIcon,
                isSelected: cubit.currentIndex == 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
