import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shop_screen_widgets/sub_categories_tab_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../buisness_logic/product_cubit/product_cubit.dart';

class CategoriesTabBarWidget extends StatefulWidget {
  final int categoryId;

  const CategoriesTabBarWidget({super.key, required this.categoryId});

  @override
  State<CategoriesTabBarWidget> createState() => _CategoriesTabBarWidgetState();
}

class _CategoriesTabBarWidgetState extends State<CategoriesTabBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductCubit cubit = ProductCubit.get(context);
          return ListView.separated(
            itemBuilder: (_, index) => SubCategoriesTabBarButton(
              isSelected: cubit.selectedIndex == index,
              subCategoryDetailsEntity: cubit.subCategories![index],
              onPressed: () {
                if (index != cubit.selectedIndex) {
                  setState(() {
                    cubit.selectedIndex = index;
                  });
                }
              },
            ),
            separatorBuilder: (_, index) => const CustomSizedBox(
              width: 8,
            ),
            itemCount: cubit.subCategories!.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
          );
        },
      ),
    );
  }
}
