import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/bottom_sheets/popularity_bottom_sheet/popularity_bottom_sheet.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../buisness_logic/product_cubit/product_cubit.dart';
import '../../buisness_logic/product_cubit/product_state.dart';
import '../../widgets/bottom_sheets/filter_botttom_sheet/filter_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_text_button.dart';
import '../../widgets/shared_widgets/products_shimmer_grid.dart';
import '../../widgets/shared_widgets/search_filter_text_field.dart';
import '../../widgets/shop_screen_widgets/categories_tab_bar_widget.dart';
import '../../widgets/shop_screen_widgets/category_product_grid_component.dart';
import '../../widgets/shop_screen_widgets/shop_app_bar.dart';
import '../home_screen/search_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  final int id;

  const CategoryDetailsScreen({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProductCubit.get(context)
        ..getAllProductByCategoryId(categoryId: id),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 63.h),
          child: ShopAppBar(
            isInternalScreen: true,
            title: title,
          ),
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
            ).onlyDirectionalPadding(
              start: 16,
              end: 16,
              top: 16,
            ),
            const CustomSizedBox(
              height: 16,
            ),
            CategoriesTabBarWidget(
              categoryId: id,
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.topSellingProducts.tr(),
                  style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
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
                        return const PopularityBottomSheet();
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LocaleKeys.mostPopular.tr(),
                        style: CustomThemes.primaryColorTextTheme(context)
                            .copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20.r,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ).symmetricPadding(horizontal: 16),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return Expanded(
                  child: ProductCubit.get(context).getProductsByCategoryIdLoading
                      ? const CategoryProductsShimmerGridComponent()
                      : Column(
                          children: [
                            Expanded(
                              child: CategoryProductsGridComponent(
                                id: id,
                              ),
                            ),
                            Visibility(
                              visible: state is GetPaginatedProductLoading,
                              child: const Center(
                                  child: CircularProgressIndicator.adaptive()),
                            )
                          ],
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
