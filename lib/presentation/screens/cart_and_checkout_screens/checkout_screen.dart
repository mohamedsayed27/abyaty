import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/shipping_type_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widgets/cart_and_checkout_widgets/cart_checkout_appbar.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/check_out_button_container.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/cost_summary_container.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/delivery_type_component.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/order_summary_widget.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/oreder_deliver_type_button.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/payment_methods_widgets/payment_methods_container.dart';
import '../../widgets/cart_and_checkout_widgets/check_out_widgets/pickup_type_component.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<Map<String, dynamic>> destinationItemsList = [
    {
      "image": SvgPath.delivery,
      "title": LocaleKeys.delivery,
    },
    {
      "image": SvgPath.pickup,
      "title": LocaleKeys.pickup,
    },
    {
      "image": SvgPath.shipping,
      "title": LocaleKeys.shipping,
    },
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: const CartAndCheckoutAppBar(
          title: LocaleKeys.checkout,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        children: [
          const OrderSummaryWidget(),
          const CustomSizedBox(
            height: 24,
          ),
          Text(
            LocaleKeys.howDoYouWantToGetYourOrder.tr(),
            style: CustomThemes.greyColo4DTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          const CustomSizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => OrderDeliverTypeButton(
                isSelected: currentIndex == index,
                title: destinationItemsList[index]["title"].toString().tr(),
                imagePath: destinationItemsList[index]["image"],
                onPressed: () {
                  if(index!=currentIndex){
                    setState(() {
                      currentIndex = index;
                    });
                  }
                },
              ),
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          if(currentIndex==0)const DeliveryTypeComponent(),
          if(currentIndex==1)const PickupComponent(),
          if(currentIndex==2)const ShippingTypeComponent(),
          PaymentMethodsContainer(isCardSelectable: currentIndex!=0,),
          const CustomSizedBox(
            height: 24,
          ),
          const CostSummaryContainer()
        ],
      ),
      bottomNavigationBar: const CheckOutButtonContainer(),
    );
  }
}
