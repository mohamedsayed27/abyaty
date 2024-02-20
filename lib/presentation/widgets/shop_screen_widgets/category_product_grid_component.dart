import 'package:abyaty/presentation/widgets/shared_widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../buisness_logic/product_cubit/product_cubit.dart';
import '../../buisness_logic/product_cubit/product_state.dart';

class CategoryProductsGridComponent extends StatelessWidget {
  const CategoryProductsGridComponent({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: width > 780 ? 160.w / 210.h : 155.w / 210.h,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: cubit.productsByCategory.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              productEntity: cubit.productsByCategory[index],
            );
          },
        );
      },
    );
  }
}
