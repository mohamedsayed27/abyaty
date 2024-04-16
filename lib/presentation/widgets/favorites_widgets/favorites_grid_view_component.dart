import 'package:abyaty/presentation/widgets/shared_widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../buisness_logic/product_cubit/product_cubit.dart';

class FavoritesProductsGridComponent extends StatefulWidget {
  const FavoritesProductsGridComponent({super.key});

  @override
  State<FavoritesProductsGridComponent> createState() => _FavoritesProductsGridComponentState();
}

class _FavoritesProductsGridComponentState extends State<FavoritesProductsGridComponent> {
  late ProductCubit cubit;
  @override
  void initState() {
    cubit = ProductCubit.get(context);
    if(cubit.favoritesProducts!.isEmpty){
      cubit.getFavoritesList();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: width > 780 ? 160.w / 210.h : 155.w / 210.h,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: cubit.favoritesProducts!.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              onTap: (){
                cubit.getProductDetails(productId: cubit.favoritesProducts![index].id!);
                Navigator.pushNamed(context, ScreenName.productDetailsScreen);
              },
              productEntity: cubit.favoritesProducts![index],
            );
          },
        );
      },
    );
  }
}
