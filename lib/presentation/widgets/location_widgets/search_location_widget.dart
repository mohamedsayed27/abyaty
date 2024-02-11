import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/custom_themes.dart';

class SearchLocationField extends StatelessWidget {
  const SearchLocationField({super.key});

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: const Color(0xffEBEBEB),
        width: 1.w,
      ),
    );
    return SizedBox(
      height: 44.h,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(12.r),
          filled: true,
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          hintText: "The Location",
          hintStyle: CustomThemes.authHintTextTheme(context).copyWith(fontSize: 14.sp),
          prefixIcon: Padding(
            padding: EdgeInsets.all(13.0.r),
            child: SvgPicture.asset(SvgPath.searchIcon,height: 16.h,width: 16.w,),
          )
        ),
      ),
    );
  }
}
