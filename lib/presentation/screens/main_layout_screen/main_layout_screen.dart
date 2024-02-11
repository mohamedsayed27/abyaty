import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/buisness_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:abyaty/presentation/buisness_logic/main_layout_cubit/main_layout_state.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/search_bar_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/home_screen_widgets/carousel_slider_widget.dart';
import '../../widgets/home_screen_widgets/home_categories_grid_view_component.dart';
import '../../widgets/home_screen_widgets/home_app_bar.dart';
import '../../widgets/main_layout_widgets/bottom_nav_bar_widget.dart';
import '../../widgets/shared_widgets/product_widget.dart';
import '../../widgets/shared_widgets/search_filter_text_field.dart';
import '../favorite_screen/favorite_screen.dart';
import '../home_screen/home_screen.dart';
import '../more_screen/more_screen.dart';
import '../shop_screen/shop_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const ShopScreen(),
    Scaffold(body: const Center().symmetricPadding(horizontal: 16),),
    const FavoriteScreen(),
    const MoreScreen(),
  ];

  int currentIndex = 0;

  void seeAllCategories(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit, MainLayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainLayoutCubit.get(context);
        return Scaffold(
          body: screens[cubit.currentIndex],
          bottomNavigationBar: const BottomNavBarWidget(),
        );
      },
    );
  }
}
