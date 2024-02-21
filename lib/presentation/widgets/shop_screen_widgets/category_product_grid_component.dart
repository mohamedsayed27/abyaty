import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../buisness_logic/product_cubit/product_cubit.dart';
import '../../buisness_logic/product_cubit/product_state.dart';
import '../shared_widgets/product_widget.dart';

class CategoryProductsGridComponent extends StatefulWidget {
  final int id;
  final ScrollPhysics? physics;
  const CategoryProductsGridComponent({super.key, required this.id, this.physics});

  @override
  State<CategoryProductsGridComponent> createState() => _CategoryProductsGridComponentState();
}

class _CategoryProductsGridComponentState extends State<CategoryProductsGridComponent> {
  late ProductCubit cubit;
  @override
  void initState() {
    cubit = ProductCubit.get(context);
      cubit.getAllProductByCategoryId(categoryId: widget.id,);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        cubit.getAllProductByCategoryId(categoryId: widget.id,);
      }
    });
    super.initState();
  }
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return GridView.builder(
          controller: scrollController,
          physics: widget.physics??const BouncingScrollPhysics(),
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
