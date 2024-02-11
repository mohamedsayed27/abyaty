import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import 'about_us_container.dart';
import 'section_title_widget.dart';

class AboutUsComponent extends StatelessWidget {
  const AboutUsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: "About Us"),
        const CustomSizedBox(
          height: 16,
        ),
        Text(
          "We make organic food In Market",
          style: CustomThemes.greyColor1ATextTheme(context)
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        Text(
          "Abyati is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: CustomThemes.greyColor99TextTheme(context)
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AboutUsContainer(
                iconPath: SvgPath.freeDelivery,
                borderColor: AppColors.primaryColor,
                title: "Free delivery for all orders",
              ),
            ),
            CustomSizedBox(
              width: 21.5,
            ),
            Expanded(
              child: AboutUsContainer(
                iconPath: SvgPath.onlyFresh,
                borderColor: AppColors.greenColor,
                title: "Only fresh food",
              ),
            ),
            CustomSizedBox(
              width: 21.5,
            ),
            Expanded(
              child: AboutUsContainer(
                iconPath: SvgPath.highQuality,
                borderColor: AppColors.secondaryColor,
                title: "High quality products",
              ),
            ),
          ],
        ),
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
