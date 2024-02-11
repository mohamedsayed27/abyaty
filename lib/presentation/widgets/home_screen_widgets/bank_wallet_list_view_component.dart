import 'package:abyaty/presentation/widgets/home_screen_widgets/bank_wallet_item_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankWalletListViewComponent extends StatelessWidget {
  const BankWalletListViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => BankWalletItemWidget(index: index),
        separatorBuilder: (_, index) => const CustomSizedBox(
          width: 16,
        ),
        itemCount: 4,
      ),
    );
  }
}
