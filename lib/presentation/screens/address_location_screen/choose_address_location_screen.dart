import 'package:abyaty/core/constants/constants.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../../translations/locale_keys.g.dart';
import '../../buisness_logic/address_cubit/address_cubit.dart';
import '../../buisness_logic/address_cubit/address_state.dart';
import '../../widgets/bottom_sheets/location_bottom_sheets/add_location_manually_bottom_sheet.dart';
import '../../widgets/bottom_sheets/location_bottom_sheets/confirm_location_bottom_sheet.dart';
import '../../widgets/location_widgets/search_location_widget.dart';
import '../../widgets/shared_widgets/custom_blurry_background.dart';
import '../../widgets/shared_widgets/custom_elevated_button.dart';
import '../../widgets/shared_widgets/custom_sized_box.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/shared_widgets/custom_text_button.dart';
import '../../widgets/shared_widgets/primary_color_elevated_button.dart';

class ChooseAddressLocationScreen extends StatefulWidget {
  final bool isNewAddress;

  const ChooseAddressLocationScreen({
    super.key,
    required this.isNewAddress,
  });

  @override
  State<ChooseAddressLocationScreen> createState() =>
      _ChooseAddressLocationScreenState();
}

class _ChooseAddressLocationScreenState
    extends State<ChooseAddressLocationScreen> {
  @override
  void initState() {
    final cubit = AddressCubit.get(context);
    cubit.getCurrentPosition();
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlurryBackground(
        child: BlocConsumer<AddressCubit, AddressState>(
          listener: (context, state) {
            if (state is GetSearchedLocationsLoading) {
              showProgressIndicator(context);
            }
            if (state is GetSearchedLocationsSuccess) {
              Navigator.pop(context);
            }
            if (state is GetLocationDescriptionLoading) {
              showProgressIndicator(context);
            }
            if (state is GetLocationDescriptionSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            AddressCubit cubit = AddressCubit.get(context);
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSizedBox(
                      height: 80,
                    ),
                    Visibility(
                      visible: !widget.isNewAddress,
                      child: const BackButton(),
                    ),
                    Visibility(
                      visible: !widget.isNewAddress,
                      child: const CustomSizedBox(
                        height: 16,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: !widget.isNewAddress
                            ? LocaleKeys.addNewAddress.tr()
                            : LocaleKeys.welcomeAt.tr(),
                        children: [
                          if (widget.isNewAddress)
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
                        style: CustomThemes.introScreensTitleHeavyTextStyle(
                                context)
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
                    if (widget.isNewAddress)
                      const CustomSizedBox(
                        height: 16,
                      ),
                    if (widget.isNewAddress)
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  ScreenName.mainLayoutScreen,
                                  (route) => false);
                            },
                          )),
                    const CustomSizedBox(
                      height: 8,
                    ),
                    SearchLocationField(
                      onSubmitted: (value) {
                        cubit.searchPlaces(value);
                      },
                      controller: searchController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.clearSearchedResult();
                          searchController.clear();
                        },
                        icon: Icon(
                          Icons.clear,
                          size: 18.r,
                        ),
                      ),
                    ),
                  ],
                ).symmetricPadding(horizontal: 16),
                const CustomSizedBox(
                  height: 8,
                ),
                Expanded(
                  child: cubit.getUserLocationLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            GoogleMap(
                              markers: cubit.markers,
                              myLocationButtonEnabled: false,
                              onMapCreated: (GoogleMapController controller) {
                                cubit.mapController = controller;
                              },
                              onTap: cubit.addMarker,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  cubit.userCurrentPosition?.latitude ?? 0,
                                  cubit.userCurrentPosition?.longitude ?? 0,
                                ),
                                zoom: 11.5,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PrimaryColorElevatedButton(
                                  onPressed:cubit.markers.isNotEmpty? () {
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
                                  }:null,
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
                                  titleStyle:
                                      CustomThemes.primaryColorTextTheme(
                                              context)
                                          .copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.primaryColor,
                                  elevation: 0,
                                ),
                              ],
                            ).symmetricPadding(horizontal: 16, vertical: 56),
                            if (cubit.searchResults.isNotEmpty)
                              Positioned.fill(
                                child: Container(
                                  color: AppColors.whiteColor,
                                  child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    separatorBuilder: (_, index) {
                                      return const CustomSizedBox(
                                        height: 8,
                                      );
                                    },
                                    itemCount: cubit.searchResults.length,
                                    // shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          // Handle item selection here, for example, navigate to the selected place on the map

                                          cubit.animateCameraToPosition(
                                            lat: cubit.searchResults[index]
                                                    .geometry?.location.lat ??
                                                0,
                                            lng: cubit.searchResults[index]
                                                    .geometry?.location.lng ??
                                                0,
                                          );
                                          cubit.clearSearchedResult();
                                        },
                                        leading: SvgPicture.asset(
                                          SvgPath.addressLocation,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.secondaryColor,
                                            BlendMode.srcIn,
                                          ),
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        title: Text(
                                          cubit.searchResults[index].name ?? "",
                                          style:
                                              CustomThemes.greyColor1ATextTheme(
                                                      context)
                                                  .copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          cubit.searchResults[index]
                                                  .formattedAddress ??
                                              '',
                                          style:
                                              CustomThemes.greyColor80TextTheme(
                                                      context)
                                                  .copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
