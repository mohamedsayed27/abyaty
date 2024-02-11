import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/filter_botttom_sheet/filter_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/popularity_bottom_sheet/popularity_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/search_filter_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../screens/home_screen/search_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      leading: null,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 54.h),
        child: Column(
          children: [
            Hero(
              tag: "searchFilter",
              child: Material(
                color: Colors.transparent,
                child: SearchFilterTextField(
                  readOnly: true,
                  enabled: true,
                  onFilterTapped: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useSafeArea: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      ),
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return const FilterBottomSheet();
                      },
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SearchScreen(),
                      ),
                    );
                  },
                ).onlyDirectionalPadding(bottom: 5, start: 16, end: 16),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            SvgPath.logo,
            width: 24.w,
            height: 24.h,
          ),
          const CustomSizedBox(
            width: 8,
          ),
          Text(
            "Abyati",
            textAlign: TextAlign.center,
            style: CustomThemes.primaryColorTextTheme(context).copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(padding: EdgeInsets.zero),
          icon: Container(
            height: 24.h,
            width: 24.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              ImagesPath.welcomeScreenImage,
              fit: BoxFit.cover,
            ),
          ),
        ).onlyDirectionalPadding(end: 8)
      ],
    );
  }
}
