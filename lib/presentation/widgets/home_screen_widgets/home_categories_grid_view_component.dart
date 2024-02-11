import 'dart:math';

import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../screens/shop_screen/category_details_screen.dart';
import '../shared_widgets/category_item_widget.dart';

class CategoriesGridViewComponent extends StatefulWidget {
  final bool shrinkWrap;
  const CategoriesGridViewComponent({super.key, this.shrinkWrap = false});

  @override
  State<CategoriesGridViewComponent> createState() =>
      _CategoriesGridViewComponentState();
}

class _CategoriesGridViewComponentState
    extends State<CategoriesGridViewComponent> {
  List<Color> itemsColor = [
    AppColors.firstDummyColor,
    AppColors.secondDummyColor,
    AppColors.thirdDummyColor,
    AppColors.fourthDummyColor,
    AppColors.fifthDummyColor,
    AppColors.sixthDummyColor,
    AppColors.seventhDummyColor,
    AppColors.eightsDummyColor,
    AppColors.ninthDummyColor,
  ];

  List<Color> chosenColorLIST = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 15.5.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return CategoryItemWidget(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryDetailsScreen(title: DummyData.categoriesDummyList[index]["title"],)));
          },
          title: DummyData.categoriesDummyList[index]["title"],
          image: DummyData.categoriesDummyList[index]["image"],
          color: (itemsColor..shuffle()).first,
        );
      },
    );
  }
}
