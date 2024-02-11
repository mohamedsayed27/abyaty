import 'package:abyaty/presentation/widgets/home_screen_widgets/bank_wallet_item_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blogs_item_widget.dart';

class HomeBlogsListViewComponent extends StatelessWidget {
  const HomeBlogsListViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => const BlogWidget(),
        separatorBuilder: (_, index) => const CustomSizedBox(
          width: 16,
        ),
        itemCount: 4,
      ),
    );
  }
}
