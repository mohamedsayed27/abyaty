import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../../core/constants/dummy_data.dart';
import '../../shared_widgets/custom_sized_box.dart';
import '../../shared_widgets/address_location_details_check_box_item.dart';

class DestinationAddressWidget extends StatefulWidget {
  final bool isShipping;

  const DestinationAddressWidget({super.key, this.isShipping = false});

  @override
  State<DestinationAddressWidget> createState() =>
      _DestinationAddressWidgetState();
}

class _DestinationAddressWidgetState extends State<DestinationAddressWidget> {
  int? selectedIndex;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.isShipping ? "Shipping Address" : "Delivery Address",
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, index) => const CustomSizedBox(
              height: 16,
            ),
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: DummyData.destinationList.length,
            itemBuilder: (_, index) => AddressLocationDetailsCheckItem(
              title: DummyData.destinationList[index]["title"],
              onPressed: () {
                if (selectedIndex != index) {
                  setState(() {
                    selectedIndex = index;
                  });
                } else {
                  selectedIndex = null;
                  setState(() {});
                }
              },
              description: DummyData.destinationList[index]["description"],
              isChecked: selectedIndex == index,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          CustomOutlinedButton(
            borderColor: AppColors.grey4D,
            borderRadius: 8,
            padding: EdgeInsets.zero,
            onPressed: () {},
            foregroundColor: AppColors.grey4D,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgPath.addNewAddressIcon,
                  width: 16.w,
                  height: 16.h,
                ),
                const CustomSizedBox(
                  width: 4,
                ),
                Text(
                  "Add New Address",
                  style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
