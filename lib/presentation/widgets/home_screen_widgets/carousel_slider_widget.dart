import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/presentation/buisness_logic/sliders_cubit/sliders_cubit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme/app_colors.dart';
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
  void initState() {
    SlidersCubit slidersCubit = SlidersCubit.get(context);
    if(slidersCubit.slidersList.isEmpty) {
      slidersCubit.getSliders();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return SizedBox(
      height: width>380?158.h:165.h,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        controller: swiperController,
        autoplayDisableOnInteraction: true,
        itemBuilder: (BuildContext context, int index) {
          return const CarouselSliderContainer();
        },
        itemCount: 3,
        itemWidth: double.infinity,
        index: currentIndex,
        onIndexChanged: (value){
          if(currentIndex !=value){
            setState(() {
              currentIndex = value;
            });
          }
        },
        itemHeight: width>380?158.h:165.h,
        fade: 0.8,
        layout: SwiperLayout.TINDER,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: AppColors.secondaryColor,
            activeSize: 12.w,
            size: 8.w
          ),
        ),

      ),
    );
  }
}
