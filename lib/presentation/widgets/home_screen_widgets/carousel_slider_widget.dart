import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../buisness_logic/sliders_cubit/sliders_cubit.dart';
import 'carousel_slider_container.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentIndex = 0;
  SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width > 380 ? 158.h : 165.h,
      width: double.infinity,
      child: BlocConsumer<SlidersCubit, SlidersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SlidersCubit cubit = SlidersCubit.get(context);
          return Swiper(
            autoplay: true,
            controller: swiperController,
            autoplayDisableOnInteraction: true,
            itemBuilder: (BuildContext context, int index) {
              return cubit.getSlider
                  ? const SliderShimmer()
                  : CarouselSliderContainer(
                      sliderDetailsEntity: cubit.slidersList[index],
                    );
            },
            itemCount: cubit.getSlider ? 3 : cubit.slidersList.length,
            itemWidth: double.infinity,
            index: currentIndex,
            onIndexChanged: (value) {
              if (currentIndex != value) {
                setState(() {
                  currentIndex = value;
                });
              }
            },
            itemHeight: width > 380 ? 158.h : 165.h,
            fade: 0.8,
            layout: SwiperLayout.TINDER,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  color: Colors.white,
                  activeColor: AppColors.secondaryColor,
                  activeSize: 12.w,
                  size: 8.w),
            ),
          );
        },
      ),
    );
  }
}

class SliderShimmer extends StatelessWidget {
  const SliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
