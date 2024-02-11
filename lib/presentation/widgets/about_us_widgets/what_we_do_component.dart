import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/about_us_widgets/section_title_widget.dart';
import 'what_we_do_container.dart';

class WhatWeDoComponent extends StatelessWidget {
  const WhatWeDoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: "What we do"),
        const CustomSizedBox(
          height: 16,
        ),
        Text(
          "We are trusted by clients",
          style: CustomThemes.greyColor1ATextTheme(context)
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const WhatWeDoContainer(
          secondaryColorTitle: "10+ ",
          boldTitle: "Business Years",
          body:
          "Just a few seconds to measure your body temperature. Up to 5 users! The battery lasts up to 2 years.",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const WhatWeDoContainer(
          secondaryColorTitle: "80K+ ",
          boldTitle: "Products Sales",
          body:
          "Just a few seconds to measure your body temperature. Up to 5 users! The battery lasts up to 2 years.",
        ),
        const CustomSizedBox(
          height: 16,
        ),
        const WhatWeDoContainer(
          secondaryColorTitle: "90%+ ",
          boldTitle: "Happy Customers",
          body:
          "Just a few seconds to measure your body temperature. Up to 5 users! The battery lasts up to 2 years.",
        ),
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
