import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsGridComponent extends StatelessWidget {
  const CategoryProductsGridComponent({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    double width =MediaQuery.of(context).size.width;
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:width>780? 160.w / 210.h:155.w / 210.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 8.h,
      ),
      itemCount: DummyData.topSellingProductsDummyList.length,
      itemBuilder: (context, index) {
        return ProductWidget(
          imagePath: DummyData.topSellingProductsDummyList[index],
          title: "Long Product Name in 2 Lines",
          oldPrice: "190",
          isFavorite: index%2!=0?true:false,
          newPrice: "100",
        );
      },
    );
  }
}
