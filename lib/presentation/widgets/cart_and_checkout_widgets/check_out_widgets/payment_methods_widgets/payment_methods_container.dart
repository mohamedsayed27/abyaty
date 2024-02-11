import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/delivery_options_check_box_widget.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/payment_methods_widgets/cash_on_delivery.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/payment_methods_widgets/pay_with_credit_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/app_theme/custom_themes.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../shared_widgets/custom_outlined_button.dart';
import '../../../shared_widgets/custom_sized_box.dart';

class PaymentMethodsContainer extends StatefulWidget {
  final bool isCardSelectable;
  const PaymentMethodsContainer({super.key, this.isCardSelectable = false});

  @override
  State<PaymentMethodsContainer> createState() =>
      _PaymentMethodsContainerState();
}

class _PaymentMethodsContainerState extends State<PaymentMethodsContainer> {
  int currentIndex = 0;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Payment Method",
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) {
              return index == 0
                  ? PayWithCreditWidget(
                      isChecked: currentIndex == index,
                      isCardsSelectable: widget.isCardSelectable,
                      onPressed: () {
                        if (currentIndex != index) {
                          currentIndex = index;
                          setState(() {});
                        }
                      },
                    )
                  : CashOnDelivery(
                      isChecked: currentIndex == index,
                      onPressed: () {
                        if (currentIndex != index) {
                          currentIndex = index;
                          setState(() {});
                        }
                      },
                    );
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, index) => const CustomSizedBox(
              height: 16,
            ),
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}
