import 'package:abyaty/core/constants/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/route_exports.dart';
import '../../../translations/locale_keys.g.dart';
import '../../buisness_logic/main_layout_cubit/main_layout_cubit.dart';
import '../../buisness_logic/main_layout_cubit/main_layout_state.dart';
import '../../widgets/home_screen_widgets/address_location_widget.dart';
import '../../widgets/home_screen_widgets/bank_wallet_list_view_component.dart';
import '../../widgets/home_screen_widgets/blogs_list_view_component.dart';
import '../../widgets/home_screen_widgets/carousel_slider_widget.dart';
import '../../widgets/home_screen_widgets/home_categories_grid_view_component.dart';
import '../../widgets/home_screen_widgets/home_app_bar.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';
import '../../widgets/shared_widgets/home_divider_widget.dart';
import '../../widgets/home_screen_widgets/top_selling_products_grid_components.dart';
import '../../widgets/shared_widgets/component_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 130.h),
        child: const HomeAppBar(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AddressLocationWidget(),
              const CarouselSliderWidget(),
              const CustomSizedBox(
                height: 8,
              ),
              BlocConsumer<MainLayoutCubit, MainLayoutState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = MainLayoutCubit.get(context);
                  return ComponentTitleWidget(
                    componentTitle: LocaleKeys.shopByCategories,
                    isSeeAll: true,
                    onSeeAllPressed: (){
                      cubit.changeCurrentIndex(1);
                    },
                  );
                },
              ).symmetricPadding(horizontal: 16),
              const CustomSizedBox(
                height: 4,
              ),
              const CategoriesGridViewComponent(shrinkWrap: true),
              const CustomSizedBox(
                height: 24,
              ),
              const CustomDividerWidget(),
              const CustomSizedBox(
                height: 24,
              ),
              const ComponentTitleWidget(
                componentTitle: LocaleKeys.bankAndWalletOffer,
                isSeeAll: false,
              ).symmetricPadding(horizontal: 16),
              const CustomSizedBox(
                height: 16,
              ),
              const BankWalletListViewComponent()
                  .symmetricPadding(horizontal: 16),
              const CustomSizedBox(
                height: 24,
              ),
              const CustomDividerWidget(),
              const CustomSizedBox(
                height: 8,
              ),
              ComponentTitleWidget(
                componentTitle: LocaleKeys.topSellingProducts,
                isSeeAll: true,
                onSeeAllPressed: () {},
              ).symmetricPadding(horizontal: 16),
              const CustomSizedBox(
                height: 4,
              ),
              const TopSellingProductsGridComponent(),
              const CustomSizedBox(
                height: 24,
              ),
              const CustomDividerWidget(),
              const CustomSizedBox(
                height: 8,
              ),
              ComponentTitleWidget(
                componentTitle: LocaleKeys.blog,
                isSeeAll: true,
                onSeeAllPressed: () {},
              ).symmetricPadding(horizontal: 16),
              const HomeBlogsListViewComponent().symmetricPadding(horizontal: 16),
              const CustomSizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
