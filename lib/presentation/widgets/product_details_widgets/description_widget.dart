import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/domain/entities/product_entity/product_details_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/dummy_data.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/home_divider_widget.dart';
import '../shared_widgets/product_widget.dart';
import 'related_product_widget.dart';

class DescriptionComponent extends StatelessWidget {
  final ProductDetailsEntity productDetailsEntity;
  const DescriptionComponent({super.key, required this.productDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 100.h,
      ),
      children: [
        Text(
          "Description",
          style: CustomThemes.greyColo4DTextTheme(context)
              .copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ).symmetricPadding(horizontal: 16),
        const CustomSizedBox(
          height: 8,
        ),
        Text(
          productDetailsEntity.details??"",
          style: CustomThemes.greyColor80TextTheme(
              context)
              .copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ).symmetricPadding(horizontal: 16),
        const CustomSizedBox(height: 16),
        const CustomDividerWidget(),
        const CustomSizedBox(
          height: 16,
        ),
        const RelatedProductWidget(),
      ],
    );
  }
}
