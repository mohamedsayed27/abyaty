import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/orders_widgets/order_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';

class TrackYourOrderScreen extends StatelessWidget {
  const TrackYourOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        "title": LocaleKeys.orderProcessing,
        "body": "12 oct 2023, 12:50 pm",
      },
      {
        "title": LocaleKeys.preProduction,
        "body": "12 oct 2023, 12:50 pm",
      },
      {
        "title": LocaleKeys.inProduction,
        "body": "12 oct 2023, 12:50 pm",
      },
      {
        "title": LocaleKeys.shipped,
        "body": "12 oct 2023, 12:50 pm",
      },
      {
        "title": LocaleKeys.delivered,
        "body": "Pending",
      },
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          63.h,
        ),
        child: const CustomAppBar(
          title: LocaleKeys.trackYourOrder,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          const OrderWidget(isDelivered: true, trackOrderWidget: true),
          const CustomSizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8.h),
                  color: AppColors.shadowColor(),
                  blurRadius: 32.r,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const TrackOrderDetailsItem(
                          imagePath: SvgPath.moreBox,
                          title: LocaleKeys.trackingCode,
                          body: "Mu193Mu"),
                      const TrackOrderDetailsItem(
                          imagePath: SvgPath.infoCircle,
                          title: LocaleKeys.packingInfo,
                          body: "Letter"),
                      TrackOrderDetailsItem(
                        imagePath: SvgPath.sourceIcon,
                        title: LocaleKeys.from,
                        body: "16 ST - Jadah Saudi Arabia",
                        bodyStyle: CustomThemes.primaryColorTextTheme(context)
                            .copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const TrackOrderDetailsItem(
                          imagePath: SvgPath.car,
                          title: LocaleKeys.trackingCode,
                          body: "Mu193Mu"),
                      const TrackOrderDetailsItem(
                          imagePath: SvgPath.calendar,
                          title: LocaleKeys.packingInfo,
                          body: "Letter"),
                      TrackOrderDetailsItem(
                        imagePath: SvgPath.destinationIcon,
                        title: LocaleKeys.from,
                        body: "16 ST - Jadah Saudi Arabia",
                        bodyStyle: CustomThemes.secondaryColorTextTheme(context)
                            .copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8.h),
                  color: AppColors.shadowColor(),
                  blurRadius: 32.r,
                ),
              ],
            ),
            child: OrderTrackStepperWidget(
              currentStep: 3,
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}

class TrackOrderDetailsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String body;
  final TextStyle? bodyStyle;

  const TrackOrderDetailsItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.body,
    this.bodyStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          imagePath,
          height: 16.h,
          width: 16.w,
          colorFilter: bodyStyle == null
              ? const ColorFilter.mode(
                  AppColors.grey4D,
                  BlendMode.srcIn,
                )
              : null,
        ),
        const CustomSizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                body,
                style: bodyStyle ??
                    CustomThemes.greyColor80TextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderTrackStepperWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int currentStep;

  const OrderTrackStepperWidget(
      {super.key, required this.items, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        items.length,
        (index) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                currentStep != index
                    ? Container(
                        height: 16.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                          color: index == 0 || index <= currentStep
                              ? AppColors.primaryColor
                              : AppColors.orderDestinationTypeWidget,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: index == 0 || index <= currentStep
                            ? Icon(
                                Icons.check,
                                weight: 5,
                                size: 10.r,
                                color: AppColors.whiteColor,
                              )
                            : null,
                      ).onlyDirectionalPadding(
                        bottom: 6, top: index != 0 ? 6 : 0)
                    : Container(
                        height: 16.h,
                        width: 16.w,
                        padding: EdgeInsets.all(4.r),
                        decoration: const BoxDecoration(
                          color: AppColors.checkBoxBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ).onlyDirectionalPadding(
                        bottom: 6, top: index != 0 ? 6 : 0),
                if (index != items.length - 1)
                  Container(
                    height: 56.h,
                    width: 4.w,
                    decoration: BoxDecoration(
                        color: index == 0 || index < currentStep
                            ? AppColors.primaryColor
                            : AppColors.orderDestinationTypeWidget,
                        borderRadius: BorderRadius.circular(4.r)),
                  )
              ],
            ),
            CustomSizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index]["title"].toString().tr(),
                    style: index == 0 || index <= currentStep
                        ? CustomThemes.primaryColorTextTheme(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          )
                        : CustomThemes.greyColor1ATextTheme(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                  Text(
                    items[index]["body"],
                    style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
