import 'package:abyaty/core/cache_helper/shared_pref_methods.dart';
import 'package:abyaty/data/datasource/remote_datasource/products_remote_data_source.dart';
import 'package:abyaty/presentation/buisness_logic/product_cubit/product_cubit.dart';
import 'package:abyaty/presentation/screens/auth_screens/login_screen.dart';
import 'package:abyaty/try_screen.dart';

import 'bloc_observer.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'core/app_theme/app_theme.dart';
import 'core/network/dio_helper.dart';
import 'core/services/services_locator.dart';
import 'presentation/buisness_logic/address_cubit/address_cubit.dart';
import 'presentation/buisness_logic/auth_cubit/auth_cubit.dart';
import 'presentation/buisness_logic/check_out_cubit/check_out_cubit.dart';
import 'presentation/buisness_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/screens/address_location_screen/saved_address_screen.dart';
import 'translations/codegen_loader.g.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  ServicesLocator().init();
  // CacheHelper.clear();
  ProductRemoteDataSource(dioHelper: sl()).getTopSellingProducts();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(
          'en',
        ),
        Locale(
          'ar',
        ),
      ],
      startLocale: const Locale("en"),
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // fontSizeResolver: (fontSize, instance) =>
      //     FontSizeResolvers.height(fontSize, instance),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CheckOutCubit()),
            BlocProvider(create: (_) => MainLayoutCubit()),
            BlocProvider(create: (_) => ProductCubit()),
            BlocProvider(create: (_) => AuthCubit()),
            BlocProvider(create: (_) => AddressCubit()..getCurrentMarker()),
          ],
          child: MaterialApp(
            title: 'Abyati',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.lightTheme,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: ScreenName.splashScreen,
            // home: LoginScreen(),
          ),
        );
      },
    );
  }
}
