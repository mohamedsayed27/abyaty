import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/orders_widgets/orders_tab_bar_widget.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_app_bar.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../translations/locale_keys.g.dart';
import '../../widgets/orders_widgets/order_widget.dart';
import '../../widgets/product_details_widgets/tab_bar_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          63.h,
        ),
        child: const CustomAppBar(
          title: LocaleKeys.orders,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            OrdersTabBarWidget(
              tabController: _tabController,
            ).onlyDirectionalPadding(start: 16, end: 16, top: 24),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    itemBuilder: (_, index) => const OrderWidget(),
                    separatorBuilder: (_, index) => const CustomSizedBox(
                      height: 16,
                    ),
                    itemCount: 5,
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    itemBuilder: (_, index) =>
                        const OrderWidget(isDelivered: false,trackOrderWidget: true),
                    separatorBuilder: (_, index) => const CustomSizedBox(
                      height: 16,
                    ),
                    itemCount: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
