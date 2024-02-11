import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/favorites_widgets/favorites_app_bar.dart';
import '../../widgets/favorites_widgets/favorites_grid_view_component.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.infinity, 63.h), child: FavoritesAppBar()),
      body: FavoritesProductsGridComponent(),
    );
  }
}
