import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../shared_widgets/custom_sized_box.dart';
import '../shared_widgets/home_divider_widget.dart';
import 'info_title_and_body_widget.dart';
import 'related_product_widget.dart';

class InfoComponent extends StatelessWidget {
  const InfoComponent({super.key});

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
        const InfoTitleAndBodyWidget(
          title: "Specialty",
          body: "Vegetarian",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Ingredient Type",
          body: "Vegetarian",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Brand",
          body: "Lavian Exotique",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Form",
          body: "Bar Brownie",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Package Information",
          body: "Box",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Manufacturer",
          body: "Prayagh Nutri Product Pvt Ltd",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Item part number",
          body: "LE 014 - 20pcs Crème Bakes",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const InfoTitleAndBodyWidget(
          title: "Net Quantity",
          body: "40.00 count",
        ),
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
