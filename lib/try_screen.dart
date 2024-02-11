import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/constants/route_exports.dart';
import 'package:abyaty/core/parameters/login_parameters.dart';
import 'package:abyaty/presentation/buisness_logic/address_cubit/address_cubit.dart';
import 'package:abyaty/presentation/buisness_logic/address_cubit/address_state.dart';
import 'package:abyaty/presentation/buisness_logic/auth_cubit/auth_cubit.dart';
import 'package:abyaty/presentation/buisness_logic/auth_cubit/auth_state.dart';
import 'package:abyaty/presentation/buisness_logic/product_cubit/product_cubit.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/constants.dart';
import 'presentation/buisness_logic/product_cubit/product_state.dart';

class TryScreen extends StatelessWidget {
  const TryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = ProductCubit.get(context);
            return PrimaryColorElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(CustomSnackBar(context, text: "dacs",backgroundColor: AppColors.errorBackgroundColor));
              },
            );
          },
        ),
      ),
    );
  }
}
