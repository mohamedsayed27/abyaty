import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shop_screen_widgets/sub_categories_tab_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTabBarWidget extends StatefulWidget {
  const CategoriesTabBarWidget({super.key});

  @override
  State<CategoriesTabBarWidget> createState() => _CategoriesTabBarWidgetState();
}

class _CategoriesTabBarWidgetState extends State<CategoriesTabBarWidget> {
  int selectedIndex = 0;
  List<Map<String, dynamic>> itemsList = [
    {
      "image": ImagesPath.carouselImage,
      "title": "All",
    },
    {
      "image": ImagesPath.productDummy1,
      "title": "Subcategory",
    },
    {
      "image": ImagesPath.productDummy2,
      "title": "Subcategory",
    },
    {
      "image": ImagesPath.productDummy3,
      "title": "Subcategory",
    },
    {
      "image": ImagesPath.productDummy4,
      "title": "Subcategory",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        itemBuilder: (_, index) => SubCategoriesTabBarButton(
          isSelected: selectedIndex == index,
          imagePath: itemsList[index]["image"],
          title: itemsList[index]["title"],
          onPressed: (){
            if(index!=selectedIndex){
              setState(() {
                selectedIndex = index;
              });
            }
          },
        ),
        separatorBuilder: (_, index) => const CustomSizedBox(
          width: 8,
        ),
        itemCount: itemsList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
      ),
    );
  }
}
