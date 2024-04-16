import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../buisness_logic/product_cubit/product_cubit.dart';
import 'product_shimmer.dart';

class CategoryProductsShimmerGridComponent extends StatelessWidget {
  final int length;
  const CategoryProductsShimmerGridComponent({super.key, this.length = 4, });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: width > 780 ? 160.w / 210.h : 155.w / 210.h,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: length,
          itemBuilder: (context, index) {
            return const ProductShimmerWidget();
          },
        );
      },
    );
  }
}
