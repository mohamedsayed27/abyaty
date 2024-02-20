import 'dart:math';

import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../buisness_logic/product_cubit/product_cubit.dart';
import '../../buisness_logic/product_cubit/product_state.dart';
import '../../screens/shop_screen/category_details_screen.dart';
import '../shared_widgets/category_item_widget.dart';

class ShopCategoriesGridViewComponent extends StatefulWidget {
  final bool shrinkWrap;
  const ShopCategoriesGridViewComponent({super.key, this.shrinkWrap = false});

  @override
  State<ShopCategoriesGridViewComponent> createState() =>
      _ShopCategoriesGridViewComponentState();
}

class _ShopCategoriesGridViewComponentState
    extends State<ShopCategoriesGridViewComponent> {
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
  Widget build(BuildContext context) {ProductCubit cubit = ProductCubit.get(context);
  return BlocConsumer<ProductCubit, ProductState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: widget.shrinkWrap,
        // padding: EdgeInsets.symmetric(horizontal: 16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.87,
          crossAxisSpacing: 15.5.w,
          mainAxisSpacing: 16.h,
        ),
        itemCount: cubit.categories!.length,
        itemBuilder: (context, index) {
          return CategoryItemWidget(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) =>
                  CategoryDetailsScreen(
                    title: DummyData.categoriesDummyList[index]["title"], id: cubit.categories![index].id!,)));
            },
            categoryDetailsEntity:cubit.categories![index],
            color: (itemsColor..shuffle()).first,
          );
        },
      );
    },
  );
  }
}
