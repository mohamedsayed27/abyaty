import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/data/models/categories/categories_details_model.dart';
import 'package:abyaty/domain/entities/categories/categories_details_entity.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryItemWidget extends StatelessWidget {
 final   CategoryDetailsEntity categoryDetailsEntity;
 final Color color;
  final void Function()? onTap;

  const CategoryItemWidget({
    super.key,
    required this.categoryDetailsEntity,
     this.onTap, required this.color,
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
              CustomSizedBox(
                width: 56,
                height: 56,
                child: CachedNetworkImageWidget(imageUrl: categoryDetailsEntity.photo!),
              ),
              CustomSizedBox(
                height: 8.h,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    categoryDetailsEntity.name??"",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
