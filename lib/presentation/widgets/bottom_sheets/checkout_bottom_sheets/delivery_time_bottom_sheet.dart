import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/buisness_logic/check_out_cubit/check_out_cubit.dart';
import 'package:abyaty/presentation/buisness_logic/check_out_cubit/check_out_state.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/home_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../cart_and_checkout_widgets/check_out_widgets/time_widget.dart';
import '../../shared_widgets/choose_date_button.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';

class DeliveryTimeBottomSheet extends StatefulWidget {
  final void Function()? openDatePicker;

  const DeliveryTimeBottomSheet({super.key, this.openDatePicker});

  @override
  State<DeliveryTimeBottomSheet> createState() =>
      _DeliveryTimeBottomSheetState();
}

class _DeliveryTimeBottomSheetState extends State<DeliveryTimeBottomSheet> {
  List<String> itemsList = [
    "12 PM - 1 PM",
    "1 PM - 2 PM",
    "2 PM - 3 PM",
    "3 PM - 4 PM",
    "4 PM - 5 PM",
    "5 PM - 6 PM",
    "6 PM - 7 PM",
    "7 PM - 8 PM",
    "8 PM - 9 PM",
    "9 PM - 10 PM",
    "10 PM - 11 PM",
    "11 PM - 12 AM",
  ];

  int? currentIndex;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Delivery Date & Time",
                    style: CustomThemes.greyColor1ATextTheme(context)
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w800),
                  ),
                  BlocConsumer<CheckOutCubit, CheckOutState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit = CheckOutCubit.get(context);
                      return CustomTextButton(
                        title: "Cancel",
                        onPressed: () {
                          if (cubit.deliveryTimeDataSubmitted == false) {
                            cubit.clearDeliveryTimeData().then((value) {
                              Navigator.pop(context);
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        style: CustomThemes.primaryColorTextTheme(context)
                            .copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(
                "Select The Desired Date",
                style: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              BlocConsumer<CheckOutCubit, CheckOutState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = CheckOutCubit.get(context);
                  return ChooseDateButton(
                    value: cubit.chosenDate != null
                        ? Jiffy.parse(cubit.chosenDate.toString()).yMd
                        : Jiffy.parse(DateTime.now().toString()).yMd,
                    onPressed: widget.openDatePicker,
                  );
                  //   CustomOutlinedButton(
                  //   borderColor: AppColors.authHintTextColor,
                  //   borderRadius: 8,
                  //   height: 48,
                  //   onPressed: widget.openDatePicker,
                  //   foregroundColor: AppColors.primaryColor,
                  //   padding: EdgeInsetsDirectional.only(
                  //       start: 8.w, end: 2.w, top: 2.h, bottom: 2.h),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         cubit.chosenDate != null
                  //             ? Jiffy.parse(cubit.chosenDate.toString()).yMd
                  //             : Jiffy.parse(DateTime.now().toString()).yMd,
                  //         style: CustomThemes.boldGreyColorTextTheme(context)
                  //             .copyWith(
                  //                 fontWeight: FontWeight.w400, fontSize: 16.sp),
                  //       ),
                  //       Ink(
                  //         height: 40.h,
                  //         width: 40.w,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(4.r),
                  //           color: AppColors.lightBlueBackgroundColor,
                  //         ),
                  //         child: Center(
                  //           child: SvgPicture.asset(
                  //             SvgPath.calendar,
                  //             height: 20.h,
                  //             width: 20.w,
                  //             alignment: Alignment.center,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
              ),
              const CustomSizedBox(
                height: 16,
              ),
              const CustomDividerWidget(
                width: 2.5,
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Text(
                "Select The Desired Time",
                style: CustomThemes.greyColor80TextTheme(context)
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              BlocConsumer<CheckOutCubit, CheckOutState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = CheckOutCubit.get(context);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 164.w / 54.h,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                    ),
                    itemCount: itemsList.length,
                    itemBuilder: (_, index) {
                      return TimeWidget(
                        title: itemsList[index],
                        isChecked: cubit.deliveryTimeIndex == index,
                        onPressed: () {
                          cubit.changeTime(itemsList[index]);
                          cubit.changeDeliveryTimeIndex(index);
                        },
                      );
                    },
                  );
                },
              ),
              const CustomSizedBox(
                height: 40,
              ),
              BlocConsumer<CheckOutCubit, CheckOutState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = CheckOutCubit.get(context);
                  return PrimaryColorElevatedButton(
                    text: "Submit",
                    onPressed: () {
                      cubit.deliveryTimeDataSubmit().then((value) {
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              ),
              const CustomSizedBox(
                height: 16,
              ),
            ],
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
