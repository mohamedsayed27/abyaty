import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/constants.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../buisness_logic/address_cubit/address_cubit.dart';
import '../../../buisness_logic/address_cubit/address_state.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/address_location_details_check_box_item.dart';

class HomeLocationBottomSheet extends StatefulWidget {
  const HomeLocationBottomSheet({super.key});

  @override
  State<HomeLocationBottomSheet> createState() =>
      _HomeLocationBottomSheetState();
}

class _HomeLocationBottomSheetState extends State<HomeLocationBottomSheet> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {

    final messenger = ScaffoldMessenger.of(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              AddressCubit cubit = AddressCubit.get(context);
              if (state is UpdateDefaultAddressLoading) {
                showProgressIndicator(context);
              }
              if (state is UpdateDefaultAddressSuccess) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
              if (state is UpdateDefaultAddressError) {
                Navigator.pop(context);
                Navigator.pop(context);
                cubit.updateDefaultAddressLocally(cubit.defaultAddress!);
                messenger.showSnackBar(
                  customSnackBar(
                    context,
                    text: state.error ?? "تم تسجيل الدخول بنجاح",
                    textAlign: TextAlign.center,
                    backgroundColor: AppColors.redColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              AddressCubit cubit = AddressCubit.get(context);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Location",
                        style:
                            CustomThemes.greyColor1ATextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Visibility(
                        visible: cubit.addressList.isNotEmpty,
                        child: CustomTextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, ScreenName.chooseAddressLocationScreen,
                                arguments: false);
                          },
                          child: Text(
                            "Add New Location",
                            style: CustomThemes.primaryColorTextTheme(context)
                                .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: cubit.addressList.isEmpty?64:8,
                  ),
                  Visibility(
                    visible: cubit.addressList.isEmpty,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          SvgPath.locationSlash,
                          height: 16.h,
                          width: 16.w,
                        ),
                        CustomSizedBox(width: 4,),
                        Expanded(
                          child: Text(
                            "It seems you didn’t enter any address before",
                            textAlign: TextAlign.center,
                            style: CustomThemes.greyColor80TextTheme(context)
                                .copyWith(
                              height: 1,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        )
                      ],
                    ).symmetricPadding(horizontal: 80-8),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (_, index) => const CustomSizedBox(
                      height: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.addressList.length,
                    itemBuilder: (_, index) => AddressLocationDetailsCheckItem(
                      title: cubit.addressList[index].lable ?? "",
                      onPressed: () {
                        cubit.updateDefaultAddressLocally(
                            cubit.addressList[index]);
                      },
                      description: cubit.addressList[index].area ?? "",
                      isChecked:
                          cubit.addressMap[cubit.addressList[index].id] == 1,
                    ),
                  ),
                   CustomSizedBox(
                     height: cubit.addressList.isEmpty?64:40,
                  ),
                  Visibility(
                    visible: cubit.addressList.isNotEmpty,
                    child: PrimaryColorElevatedButton(
                      text: "Confirm",
                      onPressed: cubit.changeAddress != null &&
                              cubit.changeAddress!.id !=
                                  cubit.defaultAddress!.id
                          ? () {
                              cubit.updateDefaultAddress(
                                  cubit.changeAddress!.id!);
                            }
                          : null,
                    ),
                  ),
                  Visibility(
                    visible: cubit.addressList.isEmpty,
                    child: PrimaryColorOutlinedButton(
                      text: "Add New Address",
                      onPressed: (){
                        if(token==null){
                          Navigator.pushNamed(context, ScreenName.loginScreen);
                        }else{
                          Navigator.pushNamed(context, ScreenName.chooseAddressLocationScreen,arguments: false,);
                        }
                      },
                    ),
                  ),
                  const CustomSizedBox(
                    height: 24,
                  ),
                ],
              );
            },
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
