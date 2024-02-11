import 'package:abyaty/presentation/widgets/cart_and_checkout_widgets/check_out_widgets/shipping_arrival_informations_container.dart';
import 'package:flutter/material.dart';

import '../../shared_widgets/custom_sized_box.dart';
import 'delivery_options_container.dart';
import 'destination_address_widget.dart';

class ShippingTypeComponent extends StatelessWidget {
  const ShippingTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ShippingArrivalInformationContainer(),
        CustomSizedBox(
          height: 24,
        ),
        DestinationAddressWidget(isShipping: true),
        CustomSizedBox(
          height: 24,
        ),
        DeliveryOptionsContainer(),
        CustomSizedBox(
          height: 24,
        ),

      ],
    );
  }
}
