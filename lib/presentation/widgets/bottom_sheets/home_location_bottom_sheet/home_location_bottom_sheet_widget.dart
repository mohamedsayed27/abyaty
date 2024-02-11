import 'package:abyaty/core/constants/constants.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/dummy_data.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              AddressCubit cubit = AddressCubit.get(context);
              if(state is UpdateDefaultAddressLoading){
                showProgressIndicator(context);
              }
              if(state is UpdateDefaultAddressSuccess){
                Navigator.pop(context);
                Navigator.pop(context);
              }
              if(state is UpdateDefaultAddressError){
                Navigator.pop(context);
                cubit.updateDefaultAddressLocally(cubit.defaultAddress!);
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
                    style: CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    child: Text(
                      "Add New Location",
                      style: CustomThemes.primaryColorTextTheme(context)
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 8,
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, index) => const CustomSizedBox(
                  height: 20,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cubit.addressList.length,
                itemBuilder: (_, index) => AddressLocationDetailsCheckItem(
                  title: cubit.addressList[index].lable??"",
                  onPressed: () {
                    cubit.updateDefaultAddressLocally(cubit.addressList[index]);
                  },
                  description: cubit.addressList[index].area??"",
                  isChecked: cubit.addressMap[cubit.addressList[index].id]==1,
                ),
              ),
              const CustomSizedBox(
                height: 40,
              ),
              PrimaryColorElevatedButton(
                text: "Confirm",
                onPressed: cubit.changeAddress!=null&&cubit.changeAddress!.id!=cubit.defaultAddress!.id?() {
                  cubit.updateDefaultAddress(cubit.changeAddress!.id!);
                }:null,
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
