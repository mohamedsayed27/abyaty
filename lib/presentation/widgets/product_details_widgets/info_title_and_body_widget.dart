import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoTitleAndBodyWidget extends StatelessWidget {
  final String title;
  final String body;

  const InfoTitleAndBodyWidget({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSizedBox(
          width: 132.w,
          child: Text(
            "$title :",
            textAlign: TextAlign.start,
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomSizedBox(width: 20.w,),
        Expanded(
          child: Text(
            body,
            textAlign: TextAlign.start,
            style: CustomThemes.greyColor80TextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
