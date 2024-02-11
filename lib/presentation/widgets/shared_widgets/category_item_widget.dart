import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryItemWidget extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final void Function()? onTap;

  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.image,
    required this.color, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Ink(
          height: 104.h,
          width: 104.w,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 8.h),
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 32.r)
            ],
          ),
          child: Column(
            children: [
              Ink.image(
                image: AssetImage(
                  image,
                ),
                width: 56.w,
                height: 56.h,
              ),
              CustomSizedBox(
                height: 8.h,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
