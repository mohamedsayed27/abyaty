import 'package:abyaty/presentation/buisness_logic/check_out_cubit/check_out_state.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/delivery_options_check_box_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../buisness_logic/check_out_cubit/check_out_cubit.dart';
import '../../bottom_sheets/checkout_bottom_sheets/delivery_time_bottom_sheet.dart';

class DeliveryOptionsContainer extends StatefulWidget {
  const DeliveryOptionsContainer({super.key,});

  @override
  State<DeliveryOptionsContainer> createState() =>
      _DeliveryOptionsContainerState();
}

class _DeliveryOptionsContainerState extends State<DeliveryOptionsContainer> {
  static List<Map<String, dynamic>> itemsList = [
    {
      "title": "Standard Delivery Option",
      "description": "Will be delivered as soon as possible ",
    },
    {
      "title": "Select Delivery Date & Time",
      "description": "Customize The date & time of delivery",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          width: 1.w,
          color: AppColors.favoriteButtonBackgroundGreyColoColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8.h),
            blurRadius: 8.r,
            color: AppColors.shadowColor(),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Options",
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          BlocConsumer<CheckOutCubit, CheckOutState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = CheckOutCubit.get(context);
              return ListView.separated(
                itemBuilder: (_, index) {
                  return DeliveryOptionsCheckBoxWidget(
                    title: index == 1 && cubit.chosenDate != null
                        ? "${Jiffy.parse(cubit.chosenDate.toString()).yMd} : ${cubit.time}"
                        : itemsList[index]['title'],
                    description: index == 1 && cubit.chosenDate != null
                        ? "Change"
                        : itemsList[index]['description'],
                    changePressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (_) => DeliveryTimeBottomSheet(
                          openDatePicker: () {
                            showDatePicker(
                              context: context,
                              initialDate: cubit.chosenDate ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 30),
                              ),
                            ).then(
                              (value) {
                                cubit.changeDate(value!);
                              },
                            ).catchError(
                              (onError) {
                                // print(chosenDate);
                              },
                            );
                          },
                        ),
                      );
                    },
                    isChecked: cubit.deliveryDestinationIndex == index,
                    isStandardOptions:
                        cubit.chosenDate != null && index == 1 ? false : true,
                    onPressed: () {
                      if (cubit.deliveryDestinationIndex != index) {
                        if (cubit.chosenDate != null) {
                          cubit.changeDeliveryDestinationIndex(index);
                        } else {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            useSafeArea: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(24.r),
                              ),
                            ),
                            showDragHandle: true,
                            isScrollControlled: true,
                            builder: (_) => DeliveryTimeBottomSheet(
                              openDatePicker: () {
                                showDatePicker(
                                  context: context,
                                  initialDate:
                                      cubit.chosenDate ?? DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 30),
                                  ),
                                ).then(
                                  (value) {
                                    cubit.changeDate(value!);
                                    cubit.changeDeliveryDestinationIndex(index);
                                  },
                                ).catchError(
                                  (onError) {
                                    // print(chosenDate);
                                  },
                                );
                              },
                            ),
                          );
                        }
                      }
                    },
                  );
                },
                shrinkWrap: true,
                separatorBuilder: (_, index) => const CustomSizedBox(
                  height: 16,
                ),
                padding: EdgeInsets.zero,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
              );
            },
          ),
        ],
      ),
    );
  }
}
