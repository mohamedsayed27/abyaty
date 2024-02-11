import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static const primaryColor = Color(0xff2A6CB5);
  static const secondaryColor = Color(0xffF9A038);
  static const carouselSecondaryGradientColor = Color(0xff365980);
  static const ratingBarFirstGradientColor = Color(0xff095EA6);
  static const ratingBarSecondGradientColor = Color(0xff43B284);
  static const greenColor = Color(0xff65C59D);
  static const successBackgroundColor = Color(0xff61C455);
  static const errorBackgroundColor = Color(0xffFF3B30);
  static const warningBackgroundColor = Color(0xffFFA72B);
  static const categoriesTabBarBackgroundColor = Color(0xffFDEFEA);
  static const darkColor = Color(0xff022660);
  static const boldGreyTextColor = Color(0xff1A1A1A);
  static const blackColor = Color(0xff000000);
  static const lightBlueBackgroundColor = Color(0xffEFF7FE);
  static const checkBoxBackgroundColor = Color(0xffCBEEFA);
  static const moreItemBackGroundColor = Color(0xffFFF7ED);
  static const redColor =  Colors.red;
  static const greyTextColor = Color(0xff999999);
  static const regularGreyTextColor = Color(0xff808080);
  static Color shadowColor({double opacity = 0.08}) => Colors.black.withOpacity(opacity);
  static const grey4D = Color(0xff4D4D4D);
  static const authHintTextColor = Color(0xffB3B3B3);
  static const searchBorderColor = Color(0xffEBEBEB);
  static const whiteColor = Color(0xffFFFFFF);
  static const inActiveSliderColor = Color(0xffE6E6E6);
  static const favoriteButtonBackgroundGreyColoColor = Color(0xffF2F2F2);
  static const popularityContainerBackgroundColor = Color(0xffF9F9F9);
  static const dividerColor = Color(0xffF5F5F5);
  static const orderDestinationTypeWidget = Color(0xffCCCCCC);
  static const cartNumberOfProductsContainerBackgroundColor = Color(0xffECF8F3);
  static const deleteItemFromCartBackgroundColor = Color(0xffFFBEBA);
  static const recommendedProductsContainerBackgroundColor = Color(0xffF4F4F4);

  /// Categories Items Color
  static Color firstDummyColor = const Color(0xffD7E2EC);
  static Color secondDummyColor = const Color(0xffFFDCAA);
  static Color thirdDummyColor = const Color(0xffD8F1E7);
  static Color fourthDummyColor = const Color(0xffFBDFD6);
  static Color fifthDummyColor = const Color(0xffE2FAD4);
  static Color sixthDummyColor = const Color(0xffCBEEFA);
  static Color seventhDummyColor = const Color(0xffFFBEBA);
  static Color eightsDummyColor = const Color(0xffE6E6E6);
  static Color ninthDummyColor = const Color(0xffFFDCAA);
}