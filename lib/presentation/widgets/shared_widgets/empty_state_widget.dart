import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/route_exports.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          SvgPath.emptyState,
          width: 163.w,
          height: 163.h,
        ),
        CustomSizedBox(
          height: 16,
        ),
        Text(
          "It Seems that something wrong here!!",
          textAlign: TextAlign.center,
          style: CustomThemes.greyColor99TextTheme(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
