import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_outlined_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared_widgets/custom_check_box.dart';

class PayWithCreditWidget extends StatefulWidget {
  final bool isChecked;
  final bool isCardsSelectable;
  final void Function()? onPressed;

  const PayWithCreditWidget({
    super.key,
    this.isChecked = false,
    this.onPressed, this.isCardsSelectable  = false,
  });

  @override
  State<PayWithCreditWidget> createState() =>
      _PayWithCreditWidgetState();
}

class _PayWithCreditWidgetState extends State<PayWithCreditWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      padding: EdgeInsets.zero,
      onPressed: widget.onPressed,
      backgroundColor: widget.isChecked
          ? AppColors.lightBlueBackgroundColor
          : AppColors.whiteColor,
      borderColor: widget.isChecked
          ? AppColors.primaryColor
          : AppColors.authHintTextColor,
      borderRadius: 8,
      foregroundColor: AppColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(SvgPath.cards,width: 16.w,height: 16.h,),
              const CustomSizedBox(width: 8,),
              Text(
                "Credit Card",
                style: widget.isChecked
                    ? CustomThemes.primaryColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      )
                    : CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
              ),
              const Spacer(),
              CustomCheckBox(isChecked: widget.isChecked),
            ],
          ),
          Text(
            "Use your cards to pay with",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomThemes.greyColor80TextTheme(context)
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ).onlyDirectionalPadding(start: 24),
          const CustomSizedBox(height: 16,),
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) => VisaCreditButton(
              imagePath: widget.isCardsSelectable?DummyData.creditCardItems[index]["image"]:DummyData.creditCardItems[0]["image"],
              isSelected: currentIndex == index,
              isCardsSelectable: widget.isCardsSelectable,
              onPressed: (){
                currentIndex = index;
                setState(() {

                });
              },
              title: DummyData.creditCardItems[index]["name"],
              pathEnd: DummyData.creditCardItems[index]["numbers"],
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, index) => const CustomSizedBox(
              height: 16,
            ),
            itemCount: widget.isCardsSelectable?DummyData.creditCardItems.length:1,
          ),
          const CustomSizedBox(
            height: 16,
          ),
          CustomOutlinedButton(
            borderColor: AppColors.orderDestinationTypeWidget,
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
                  "Add New Card",
                  style: CustomThemes.greyColo4DTextTheme(context)
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ) 
              ],
            ),
          ),
        ],
      ).symmetricPadding(vertical: 12, horizontal: 16),
    );
  }
}

class VisaCreditButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final String pathEnd;
  final bool isSelected;
  final bool isCardsSelectable;
  final void Function()? onPressed;

  const VisaCreditButton({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.isCardsSelectable,
    this.onPressed,
    required this.title,
    required this.pathEnd,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      borderRadius: 16,
      height: 68,
      onPressed: onPressed,
      padding: EdgeInsets.all(16.r),
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.whiteColor,
      borderColor: AppColors.orderDestinationTypeWidget,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 36.h,
            width: 48.w,
          ),
          const CustomSizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,style: CustomThemes.greyColo4DTextTheme(context).copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                    if (isCardsSelectable)
                      CustomCheckBox(
                        height: 16,
                        width: 16,
                        padding: 3,
                        isChecked: isSelected,
                      )
                  ],
                ),
                Expanded(child: Text("**** **** **** $pathEnd",style: CustomThemes.greyColor80TextTheme(context).copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
