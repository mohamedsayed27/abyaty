import 'package:abyaty/presentation/buisness_logic/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../widgets/cart_and_checkout_widgets/cart_button.dart';
import '../../widgets/product_details_widgets/care_instruction_component.dart';
import '../../widgets/product_details_widgets/description_widget.dart';
import '../../widgets/product_details_widgets/info_widgets.dart';
import '../../widgets/product_details_widgets/product_details_cart_button.dart';
import '../../widgets/product_details_widgets/product_details_image_component.dart';
import '../../widgets/product_details_widgets/product_details_shimmer.dart';
import '../../widgets/product_details_widgets/reviews_component.dart';
import '../../widgets/product_details_widgets/tab_bar_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        return Scaffold(
          body: DefaultTabController(
            length: 4,
            child: cubit.getProductDetailsLoading
                ? const ProductDetailsShimmer()
                : Stack(
                    children: [
                      NestedScrollView(
                        headerSliverBuilder: (_, innerBoxIsScrolled) => [
                          SliverAppBar(
                            expandedHeight: width > 380 ? 400.h : 450.h,
                            // Set your desired height
                            pinned: true,
                            surfaceTintColor: AppColors.whiteColor,
                            leading: BackButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: AppColors.grey4D,
                            ),
                            actions: const [CartButton()],
                            bottom: PreferredSize(
                              preferredSize: Size(double.infinity,
                                  AppBar().preferredSize.height),
                              child: ProductDetailsTabBarWidget(
                                tabController: _tabController,
                              ),
                            ),
                            flexibleSpace:  FlexibleSpaceBar(
                              collapseMode: CollapseMode.parallax,
                              background: ProductDetailsImagesList(image: "",),
                            ),
                          ),
                        ],
                        body: Column(
                          children: [
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children:  [
                                  DescriptionComponent(productDetailsEntity: cubit.productDetailsEntity!,),
                                  InfoComponent(),
                                  CareInstructionComponent(),
                                  const ReviewsComponent(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ProductDetailsCartButton(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
