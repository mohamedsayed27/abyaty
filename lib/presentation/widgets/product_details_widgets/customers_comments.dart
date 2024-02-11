import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';

class CustomersComments extends StatefulWidget {
  const CustomersComments({super.key});

  @override
  State<CustomersComments> createState() => _CustomersCommentsState();
}

class _CustomersCommentsState extends State<CustomersComments> {
  List<Map<String, dynamic>> commentsList = [
    {
      "name": "Mustafa Emad",
      "comment": "Good",
      "rating":3.0,
    },
    {
      "name": "Mohamed Sayed",
      "comment": "Impressive",
      "rating":5.0,
    },
    {
      "name": "Abdelkader Mohamed",
      "comment": "Very goodGood",
      "rating":4.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) =>  CommentItem(name: commentsList[index]["name"], starRate: commentsList[index]["rating"], comment: commentsList[index]["comment"],),
      separatorBuilder: (_, index) => const CustomSizedBox(
        height: 16,
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
  const CommentItem({super.key, required this.name, required this.starRate, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
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
          CustomSizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,style: CustomThemes.greyColor1ATextTheme(context).copyWith(fontSize: 16.sp,fontWeight: FontWeight.w400,),),
                    Text("10 Oct",style: CustomThemes.greyColorB3TextTheme(context).copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400,),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      initialRating: starRate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 18.r,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
                      itemBuilder: (context, index) => SvgPicture.asset(
                        index > starRate - 1 ? SvgPath.star : SvgPath.boldStar,
                        colorFilter: const ColorFilter.mode(
                            AppColors.secondaryColor, BlendMode.srcIn),
                        height: 16.h,
                        width: 16.w,
                      ),
                      onRatingUpdate: (rating) {
                      },
                    ),
                    Text("1:26 pm",style: CustomThemes.greyColorB3TextTheme(context).copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400,),),
                  ],
                ),
                CustomSizedBox(height: 8,),
                Expanded(child: Text(comment,style: CustomThemes.greyColo4DTextTheme(context).copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400,),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
