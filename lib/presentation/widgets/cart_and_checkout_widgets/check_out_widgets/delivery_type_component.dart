import 'package:flutter/material.dart';

import '../../shared_widgets/custom_sized_box.dart';
import 'delivery_options_container.dart';
import 'destination_address_widget.dart';

class DeliveryTypeComponent extends StatelessWidget {
  const DeliveryTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DestinationAddressWidget(),
        const CustomSizedBox(
          height: 24,
        ),
        const DeliveryOptionsContainer(),
        const CustomSizedBox(
          height: 24,
        ),

      ],
    );
  }
}
