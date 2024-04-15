import 'dart:math';

import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/presentation/buisness_logic/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../buisness_logic/product_cubit/product_state.dart';
import '../../screens/shop_screen/category_details_screen.dart';
import '../shared_widgets/category_item_widget.dart';
import '../shared_widgets/category_shimmer_widget.dart';
import '../shared_widgets/empty_state_widget.dart';

class CategoriesGridViewComponent extends StatefulWidget {
  final bool shrinkWrap;

  const CategoriesGridViewComponent({super.key, this.shrinkWrap = false});

  @override
  State<CategoriesGridViewComponent> createState() =>
      _CategoriesGridViewComponentState();
}

class _CategoriesGridViewComponentState
    extends State<CategoriesGridViewComponent> {
  List<Color> itemsColor = [
    AppColors.firstDummyColor,
    AppColors.secondDummyColor,
    AppColors.thirdDummyColor,
    AppColors.fourthDummyColor,
    AppColors.fifthDummyColor,
    AppColors.sixthDummyColor,
    AppColors.seventhDummyColor,
    AppColors.eightsDummyColor,
    AppColors.ninthDummyColor,
  ];

  List<Color> chosenColorLIST = [];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        return cubit.getCategoriesLoading
            ? const CategoriesShimmerGridViewComponent()
            : cubit.categories!.isNotEmpty?GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: widget.shrinkWrap,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.87,
                  crossAxisSpacing: 15.5.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount:
                    cubit.categories!.length > 9 ? 9 : cubit.categories!.length,
                itemBuilder: (context, index) {
                  return CategoryItemWidget(
                    onTap: () {
                      cubit.productByCategoryPageNumber = 1;
                      cubit.productsByCategory = [];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryDetailsScreen(
                            title: cubit.categories![index].name ?? "",
                            id: cubit.categories![index].id!,
                          ),
                        ),
                      );
                    },
                    categoryDetailsEntity: cubit.categories![index],
                    color: (itemsColor..shuffle()).first,
                  );
                },
              ):EmptyStateWidget();
      },
    );
  }
}
