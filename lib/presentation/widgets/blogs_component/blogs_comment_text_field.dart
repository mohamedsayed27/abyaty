import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../core/constants/route_exports.dart';
import '../shared_widgets/custom_elevated_button.dart';

class BlogsCommentTextField extends StatelessWidget {
  const BlogsCommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.authHintTextColor,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(8.r),
    );
    return TextFormField(
      style: CustomThemes.authStringTextTheme(context),
      decoration: InputDecoration(
        focusedBorder: border,
        border: border,
        enabledBorder: border,
        contentPadding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 4.w,
          top: 4.h,
          bottom: 4.h,
        ),
        hintText: "Write the promo code ...",
        hintStyle: CustomThemes.authHintTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: CustomElevatedButton(
          borderRadius: 4,
          height: 40,
          onPressed: (){},
          backgroundColor: AppColors.lightBlueBackgroundColor,
          foregroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            SvgPath.sendIcon,
            width: 16.w,
            height: 16.h,
          ),
        ).onlyDirectionalPadding(top: 4,bottom: 4,end: 4),
      ),
    );
  }}
