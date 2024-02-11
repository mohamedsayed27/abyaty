import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class BlogsComments extends StatefulWidget {
  const BlogsComments({super.key});

  @override
  State<BlogsComments> createState() => _BlogsCommentsState();
}

class _BlogsCommentsState extends State<BlogsComments> {
  List<Map<String, dynamic>> commentsList = [
    {
      "name": "Mustafa Emad",
      "comment": "Good",
      "rating": 3.0,
    },
    {
      "name": "Mohamed Sayed",
      "comment": "Impressive",
      "rating": 5.0,
    },
    {
      "name": "Abdelkader Mohamed",
      "comment": "Very goodGood",
      "rating": 4.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) => CommentItem(
        name: commentsList[index]["name"],
        starRate: commentsList[index]["rating"],
        comment: commentsList[index]["comment"],
      ),
      separatorBuilder: (_, index) => const CustomSizedBox(
        height: 8,
      ),
      itemCount: commentsList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String name;
  final String comment;
  final double starRate;

  const CommentItem({
    super.key,
    required this.name,
    required this.starRate,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.h,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            blurRadius: 32.r,
            color: AppColors.shadowColor(),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              ImagesPath.commentProfileDummyImage,
              fit: BoxFit.cover,
            ),
          ),
          const CustomSizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "15 Oct, 2023",
                  style: CustomThemes.greyColorB3TextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Text(
                    comment,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
