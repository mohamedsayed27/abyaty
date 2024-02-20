import '../../../../core/app_router/screens_name.dart';
import '../../../../core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/parameters/address_parameters.dart';
import '../../../buisness_logic/address_cubit/address_cubit.dart';
import '../../../buisness_logic/address_cubit/address_state.dart';
import '../../shared_widgets/custom_sized_box.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/form_item_widget.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';
import '../../shared_widgets/save_address_as_a_default_check.dart';

class AddLocationManuallyBottomSheet extends StatefulWidget {
  const AddLocationManuallyBottomSheet({super.key});

  @override
  State<AddLocationManuallyBottomSheet> createState() =>
      _AddLocationManuallyBottomSheetState();
}

class _AddLocationManuallyBottomSheetState
    extends State<AddLocationManuallyBottomSheet> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddressCubit cubit = AddressCubit.get(context);
    final messenger = ScaffoldMessenger.of(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: SafeArea(
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              if(state is PostAddressLoading){
                showProgressIndicator(context);
              }
              if(state is PostAddressSuccess){
                Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayoutScreen, (route) => false);
                messenger.showSnackBar(customSnackBar(context, text: state.addressResponseEntity.message??"",backgroundColor: AppColors.greenColor,));
                cubit.getAddressList();
              }
              if(state is PostAddressError){
                messenger.showSnackBar(customSnackBar(context, text: state.error??"",backgroundColor: AppColors.redColor,),);
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Address Manually",
                          style: CustomThemes.greyColor1ATextTheme(context)
                              .copyWith(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        CustomTextButton(
                          title: "Cancel",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: CustomThemes.primaryColorTextTheme(context)
                              .copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const CustomSizedBox(
                      height: 8,
                    ),
                    FormItemWidget(
                      title: "Address Label",
                      hintText: "EX : Home",
                      isRequired: true,
                      controller: cubit.addManuallyLabel,
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    FormItemWidget(
                      title: "Area",
                      hintText: "EX : Home",
                      isRequired: true,
                      controller: cubit.addManuallyArea,
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    FormItemWidget(
                      title: "Address Details",
                      hintText: "EX: 25 ST - Wadi Ad-Dawasir",
                      isRequired: true,
                      controller: cubit.addManuallyDetails,
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    FormItemWidget(
                      title: "Floor Number",
                      hintText: "EX: 4 ( optional )",
                      controller: cubit.addManuallyFloorNumber,
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    FormItemWidget(
                      title: "Flat Number",
                      hintText: "EX: 4 ( optional )",
                      controller: cubit.addManuallyFlatNumber,
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    const SaveAddressAsADefault(),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    PrimaryColorElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() != null) {
                          cubit.postAddress(
                            AddressParameters(
                              id: null,
                              lable: cubit.addManuallyLabel.text,
                              area: cubit.addManuallyArea.text,
                              details: cubit.addManuallyDetails.text,
                              floorNumber: cubit.addManuallyFloorNumber.text,
                              flatNumber: cubit.addManuallyFlatNumber.text,
                              isDefault: cubit.isDefault == null
                                  ? "0"
                                  : cubit.isDefault!,
                              userId: 20,
                            ),
                          );
                        }
                      },
                      text: "Submit",
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                  ],
                ),
              );
            },
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
