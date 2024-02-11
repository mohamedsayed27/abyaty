import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_blurry_background.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/bottom_sheets/location_bottom_sheets/add_location_manually_bottom_sheet.dart';
import '../../widgets/bottom_sheets/location_bottom_sheets/confirm_location_bottom_sheet.dart';
import '../../widgets/location_widgets/search_location_widget.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseAddressLocationScreen extends StatelessWidget {
  final bool isNewAddress;

  const ChooseAddressLocationScreen({super.key, required this.isNewAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlurryBackground(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(
                  height: 80,
                ),
                Visibility(
                  visible: !isNewAddress,
                  child: const BackButton(),
                ),
                Visibility(
                  visible: !isNewAddress,
                  child: const CustomSizedBox(
                    height: 16,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: !isNewAddress
                        ? LocaleKeys.addNewAddress.tr()
                        : LocaleKeys.welcomeAt.tr(),
                    children: [
                      if (isNewAddress)
                        TextSpan(
                          text: " ${LocaleKeys.abyati.tr()} 👋🏻",
                          style: CustomThemes
                                  .authSecondaryColorTitleHeavyTextStyle(
                                      context)
                              .copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                    ],
                    style: CustomThemes.introScreensTitleHeavyTextStyle(context)
                        .copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                Text(
                  LocaleKeys.enterYourLocation.tr(),
                  textAlign: TextAlign.start,
                  style: CustomThemes.introScreensBodyTextStyle(context),
                ).onlyDirectionalPadding(end: 39),
                if (isNewAddress)
                  const CustomSizedBox(
                    height: 16,
                  ),
                if (isNewAddress)
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: CustomTextButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              LocaleKeys.skipForNow.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                            const CustomSizedBox(
                              width: 4,
                            ),
                            Icon(Icons.arrow_forward_outlined, size: 20.r),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              ScreenName.mainLayoutScreen, (route) => false);
                        },
                      )),
                const CustomSizedBox(
                  height: 8,
                ),
                const SearchLocationField(),
              ],
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(
              height: 8,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const GoogleMap(
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(23.61108120291162, 45.286281856525534),
                      zoom: 11.5,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryColorElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            useSafeArea: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(24.r),
                              ),
                            ),
                            showDragHandle: true,
                            isScrollControlled: true,
                            builder: (context) {
                              return const ConfirmLocationBottomSheet();
                            },
                          );
                        },
                        height: 48,
                        text: LocaleKeys.confirmLocation.tr(),
                      ),
                      const CustomSizedBox(
                        height: 16,
                      ),
                      CustomElevatedButton(
                        borderRadius: 8,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            useSafeArea: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(24.r),
                              ),
                            ),
                            showDragHandle: true,
                            isScrollControlled: true,
                            builder: (context) {
                              return const AddLocationManuallyBottomSheet();
                            },
                          );
                        },
                        height: 48,
                        text: LocaleKeys.addManually,
                        width: double.infinity,
                        titleStyle: CustomThemes.primaryColorTextTheme(context)
                            .copyWith(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryColor,
                        elevation: 0,
                      ),
                    ],
                  ).symmetricPadding(horizontal: 16, vertical: 56)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
