import 'package:flutter/material.dart';

import '../../shared_widgets/custom_sized_box.dart';
import 'our_stores_details_container.dart';

class PickupComponent extends StatelessWidget {
  const PickupComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OurStoreDetailsContainer(),
        CustomSizedBox(
          height: 24,
        ),
      ],
    );
  }
}
