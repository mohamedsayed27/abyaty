import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/filter_botttom_sheet/filter_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/shared_widgets/search_filter_text_field.dart';
import '../../widgets/shop_screen_widgets/shop_app_bar.dart';
import '../../widgets/shop_screen_widgets/shop_categoris_grid_component.dart';
import '../home_screen/search_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child:  const ShopAppBar(title: LocaleKeys.shop,),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(),
                  offset: Offset(0, 8.h),
                  blurRadius: 32.r,
                )
              ],
            ),
            child: Hero(
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
                  hintText: LocaleKeys.whatAreYouLookingFor.tr(),
                  searchIconColor: AppColors.authHintTextColor,
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 16,),
          const Expanded(child: ShopCategoriesGridViewComponent(shrinkWrap: false),)
        ],
      ).onlyDirectionalPadding(start: 16,end: 16,top: 16),
    );
  }
}
