import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/product_details_widgets/product_name_price_favorite_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/cached_network_image_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../../domain/entities/product_entity/product_details_details_entity.dart';

class ProductDetailsImagesList extends StatefulWidget {
  final String image;
  final ProductDetailsEntity productDetailsEntity;
  const ProductDetailsImagesList({super.key, required this.image, required this.productDetailsEntity});

  @override
  State<ProductDetailsImagesList> createState() =>
      _ProductDetailsImagesListState();
}

class _ProductDetailsImagesListState extends State<ProductDetailsImagesList> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 318.h,
              width: double.infinity,
              color: AppColors.favoriteButtonBackgroundGreyColoColor,
              child: PageView.builder(
                controller: controller,
                itemCount: DummyData.topSellingProductsDummyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      height: 160.h,
                      width: 192.w,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8.h),
                            color: AppColors.shadowColor(opacity: 0.1),
                            blurRadius: 32.r,
                          )
                        ],
                      ),
                      child: CachedNetworkImageWidget(
                        imageUrl: widget.image,
                        fit: BoxFit.contain,
                      ),
                    ),
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
                  count: DummyData.topSellingProductsDummyList.length,
                  effect: ExpandingDotsEffect(
                    spacing: 4.w,
                    radius: 4.r,
                    dotHeight: 6.h,
                    dotWidth: 6.w,
                    expansionFactor: 2,
                    paintStyle: PaintingStyle.fill,
                    dotColor: AppColors.greyTextColor,
                    activeDotColor: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
         ProductNameAndPriceAndFavoriteWidget(productDetailsEntity: widget.productDetailsEntity,),
      ],
    );
  }
}
