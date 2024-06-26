import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../domain/entities/product_entity/product_details_details_entity.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/home_divider_widget.dart';
import 'info_title_and_body_widget.dart';
import 'related_product_widget.dart';

class InfoComponent extends StatelessWidget {
  final ProductDetailsEntity? productDetailsEntity;

  const InfoComponent({super.key, this.productDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 100.h,
      ),
      children: [
        Text(
          "Additional Info",
          style: CustomThemes.greyColo4DTextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ).symmetricPadding(horizontal: 16),
        const CustomSizedBox(
          height: 16,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemBuilder: (_, index) {
            return Text(
              productDetailsEntity?.info?.tags?[index].value ?? "",
              textAlign: TextAlign.start,
              style: CustomThemes.greyColor80TextTheme(context).copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const CustomSizedBox(
              height: 16,
            );
          },
          itemCount: productDetailsEntity?.info?.tags?.length ?? 0,
        ),
        // const InfoTitleAndBodyWidget(
        //   title: "Ingredient Type",
        //   body: "Vegetarian",
        // ),
        // const CustomSizedBox(
        //   height: 16,
        // ),
        // const InfoTitleAndBodyWidget(
        //   title: "Brand",
        //   body: "Lavian Exotique",
        // ),
        // const CustomSizedBox(
        //   height: 16,
        // ),
        // const InfoTitleAndBodyWidget(
        //   title: "Form",
        //   body: "Bar Brownie",
        // ),
        // const CustomSizedBox(
        //   height: 16,
        // ),
        // const InfoTitleAndBodyWidget(
        //   title: "Package Information",
        //   body: "Box",
        // ),
        // const CustomSizedBox(
        //   height: 16,
        // ),
        // const InfoTitleAndBodyWidget(
        //   title: "Manufacturer",
        //   body: "Prayagh Nutri Product Pvt Ltd",
        // ),
        // const CustomSizedBox(
        //   height: 16,
        // ),
        // const InfoTitleAndBodyWidget(
        //   title: "Item part number",
        //   body: "LE 014 - 20pcs Crème Bakes",
        // ),
        // const CustomSizedBox(
        //   height: 16,
        // ),
        // const InfoTitleAndBodyWidget(
        //   title: "Net Quantity",
        //   body: "40.00 count",
        // ),
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
