import '../constants/route_exports.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.chooseAddressLocationScreen:
          final isNewAddress = settings.arguments as bool;
          return MaterialPageRoute(builder: (_) => ChooseAddressLocationScreen(isNewAddress: isNewAddress,));
        case ScreenName.savedAddressScreen:
          return MaterialPageRoute(builder: (_) => const SavedAddressScreen());
        case ScreenName.createNewPasswordScreen:
          return MaterialPageRoute(builder: (_) => const CreateNewPasswordScreen());
        case ScreenName.forgotPasswordScreen:
          return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
        case ScreenName.loginScreen:
          return MaterialPageRoute(builder: (_) => const LoginScreen());
        case ScreenName.signUpScreen:
          return MaterialPageRoute(builder: (_) => const SignUpScreen());
        case ScreenName.cartScreen:
          return MaterialPageRoute(builder: (_) => const CartScreen());
        case ScreenName.blogsScree:
          return MaterialPageRoute(builder: (_) => const BlogsScreen());
        case ScreenName.checkoutScreen:
          return MaterialPageRoute(builder: (_) => const CheckOutScreen());
        case ScreenName.favoriteScreen:
          return MaterialPageRoute(builder: (_) => const FavoriteScreen());
        case ScreenName.homeScreen:
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        case ScreenName.searchScreen:
          return MaterialPageRoute(builder: (_) => const SearchScreen());
        case ScreenName.splashScreen:
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        case ScreenName.onboardingScreen:
          return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        case ScreenName.welcomeScreen:
          return MaterialPageRoute(builder: (_) => const WelcomeScreen());
        case ScreenName.mainLayoutScreen:
          return MaterialPageRoute(builder: (_) => const MainLayoutScreen());
        case ScreenName.ordersScreen:
          return MaterialPageRoute(builder: (_) => const OrdersScreen());
        case ScreenName.trackYourOrderScreen:
          return MaterialPageRoute(builder: (_) => const TrackYourOrderScreen());
        case ScreenName.overViewScreen:
          return MaterialPageRoute(builder: (_) => const OverViewScreen());
        case ScreenName.productDetailsScreen:
          return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
        case ScreenName.editProfileScreen:
          return MaterialPageRoute(builder: (_) => const EditProfileScreen());
        case ScreenName.profileScreen:
          return MaterialPageRoute(builder: (_) => const ProfileScreen());
        case ScreenName.saveCardsScreen:
          return MaterialPageRoute(builder: (_) => const SaveCardsScreen());
        case ScreenName.categoriesScreen:
          return MaterialPageRoute(builder: (_) => const CategoryDetailsScreen(title: "Sports"));
        case ScreenName.shopScreen:
          return MaterialPageRoute(builder: (_) => const ShopScreen());

        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error when routing to this screen'),
        ),
      );
    });
  }
}
class CupertinoRoute {

}
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
        );
}
