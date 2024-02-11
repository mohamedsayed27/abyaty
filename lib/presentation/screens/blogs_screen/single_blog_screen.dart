import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/constants/dummy_data.dart';
import '../../widgets/blogs_component/blogs_comment_text_field.dart';
import '../../widgets/blogs_component/blogs_comments.dart';

class SingleBlogScreen extends StatefulWidget {
  const SingleBlogScreen({super.key});

  @override
  State<SingleBlogScreen> createState() => _SingleBlogScreenState();
}

class _SingleBlogScreenState extends State<SingleBlogScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (_, isScrolling) {
        return [
          SliverAppBar(
            expandedHeight: (300.h - AppBar().preferredSize.height),
            pinned: true,
            surfaceTintColor: AppColors.whiteColor,
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: AppColors.grey4D,
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                children: [
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    color: AppColors.favoriteButtonBackgroundGreyColoColor,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: DummyData.dummyBlogs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          DummyData.dummyBlogs[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    bottom: 24.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: DummyData.dummyBlogs.length,
                        effect: ExpandingDotsEffect(
                          spacing: 4.w,
                          radius: 4.r,
                          dotHeight: 6.h,
                          dotWidth: 6.w,
                          expansionFactor: 2,
                          paintStyle: PaintingStyle.fill,
                          dotColor: AppColors.whiteColor,
                          activeDotColor: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h,),
        children: [
          Text(
            "15 Oct, 2023",
            style: CustomThemes.greyColorB3TextTheme(context)
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          Text(
            "How to enhance your online shopping Experience ?",
            style: CustomThemes.greyColor1ATextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            "Abyati is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: CustomThemes.greyColor99TextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Container(
            height: 132.h,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              ImagesPath.dummySingleBlogImage,
              fit: BoxFit.cover,
            ),
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
            height: 32,
          ),
          const Row(
            children: [
              Expanded(
                child: LikeButton(),
              ),
              CustomSizedBox(
                width: 18,
              ),
              Expanded(
                child: ShareButton(),
              ),
            ],
          ),
          const CustomSizedBox(
            height: 40,
          ),
          Text(
            "Comments",
            style: CustomThemes.greyColor80TextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const BlogsCommentTextField(),
          const CustomSizedBox(
            height: 24,
          ),
          const BlogsComments()
        ],
      ),
    ));
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryColorOutlinedButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            SvgPath.likeBlog,
            height: 16.h,
            width: 16.w,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const CustomSizedBox(
            width: 4,
          ),
          Text(
            "Like",
            style: CustomThemes.primaryColorTextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryColorOutlinedButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            SvgPath.shareBlog,
            height: 16.h,
            width: 16.w,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const CustomSizedBox(
            width: 4,
          ),
          Text(
            "Share",
            style: CustomThemes.primaryColorTextTheme(context)
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
