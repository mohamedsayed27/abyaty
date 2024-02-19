import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../buisness_logic/address_cubit/address_cubit.dart';
import '../../buisness_logic/address_cubit/address_state.dart';
import '../bottom_sheets/home_location_bottom_sheet/home_location_bottom_sheet_widget.dart';

class AddressLocationWidget extends StatefulWidget {
  const AddressLocationWidget({super.key});

  @override
  State<AddressLocationWidget> createState() => _AddressLocationWidgetState();
}

class _AddressLocationWidgetState extends State<AddressLocationWidget> {
  @override
  void initState() {
    AddressCubit cubit =AddressCubit.get(context);
    if(cubit.addressList.isEmpty){
      AddressCubit.get(context).getAddressList();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AddressCubit cubit = AddressCubit.get(context);
        return ListTile(
          onTap: () {
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
                return const HomeLocationBottomSheet();
              },
            ).then((ee) {
              cubit.updateDefaultAddressLocally(cubit.defaultAddress);
            });
          },
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          titleAlignment: ListTileTitleAlignment.titleHeight,
          minLeadingWidth: 0,
          horizontalTitleGap: 4.w,
          trailing: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 26.r,
            color: AppColors.greyTextColor,
          ),
          leading: SvgPicture.asset(
            SvgPath.addressLocation,
            colorFilter: ColorFilter.mode(
              cubit.defaultAddress == null
                  ? AppColors.grey4D
                  : AppColors.secondaryColor,
              BlendMode.srcIn,
            ),
            height: 16.h,
            width: 16.w,
          ),
          title: state is GetListAddressLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    height: 32.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                )
              : Text(
                  cubit.defaultAddress?.lable ?? "Deliver to :",
                  style: CustomThemes.greyColo4DTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        );
      },
    );
  }
}
