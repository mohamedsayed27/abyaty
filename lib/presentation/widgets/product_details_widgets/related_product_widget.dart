import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/dummy_data.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/product_widget.dart';

class RelatedProductWidget extends StatelessWidget {
  const RelatedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Related Products",
          style: CustomThemes.greyColo4DTextTheme(context)
              .copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ).symmetricPadding(horizontal: 16),
        CustomSizedBox(
          height: width>380?270:275,
          child: ListView.separated(
            padding: EdgeInsets.only(right: 16.w,left:16.w,top: 16.h,bottom: 36.h),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => ProductWidget(
              imagePath: DummyData
                  .topSellingProductsDummyList[index],
              title: "Long Product Name in 2 Lines",
              oldPrice: "100",
              newPrice: "90",
              width: 164.w,
            ),
            separatorBuilder: (_, index) =>
            const CustomSizedBox(
              width: 15,
            ),
            itemCount: DummyData
                .topSellingProductsDummyList.length,
          ),
        ),
      ],
    );
  }
}
