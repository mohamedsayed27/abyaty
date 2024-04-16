import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/empty_state_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/product_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/products_shimmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../buisness_logic/product_cubit/product_cubit.dart';

class TopSellingProductsGridComponent extends StatefulWidget {
  const TopSellingProductsGridComponent({super.key});

  @override
  State<TopSellingProductsGridComponent> createState() =>
      _TopSellingProductsGridComponentState();
}

class _TopSellingProductsGridComponentState
    extends State<TopSellingProductsGridComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    double width = MediaQuery.of(context).size.width;
    ProductCubit cubit = ProductCubit.get(context);
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetTopSellingProductsLoading
            ? const CategoryProductsShimmerGridComponent()
            : cubit.topSellingProducts!.isNotEmpty?GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: width > 780 ? 160.w / 210.h : 155.w / 210.h,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 8.h,
                ),
                itemCount: cubit.topSellingProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(

                    onTap: (){
                      cubit.getProductDetails(productId: cubit.topSellingProducts![index].id!);
                      Navigator.pushNamed(context, ScreenName.productDetailsScreen);
                    },
                    productEntity: cubit.topSellingProducts![index],
                  );
                },
              ):EmptyStateWidget();
      },
    );
  }
}
