import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../shared_widgets/custom_switch_button.dart';

class NewsLetterBottomSheet extends StatefulWidget {
  final void Function()? openDatePicker;

  const NewsLetterBottomSheet({super.key, this.openDatePicker});

  @override
  State<NewsLetterBottomSheet> createState() =>
      _NewsLetterBottomSheetState();
}

class _NewsLetterBottomSheetState extends State<NewsLetterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "News Letter",
                style: CustomThemes.greyColor1ATextTheme(context)
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.orderDestinationTypeWidget,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subscribe to our Newsletter",
                            style: CustomThemes.greyColor1ATextTheme(context)
                                .copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const CustomSizedBox(
                            height: 4,
                          ),
                          Text(
                            "To: mustafa193@example.com",
                            style: CustomThemes.greyColor99TextTheme(context)
                                .copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSwitchButton(),
                    const CustomSizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
