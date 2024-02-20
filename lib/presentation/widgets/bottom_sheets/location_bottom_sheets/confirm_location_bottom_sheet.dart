import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/parameters/address_parameters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/custom_themes.dart';
import '../../../buisness_logic/address_cubit/address_cubit.dart';
import '../../../buisness_logic/address_cubit/address_state.dart';
import '../../shared_widgets/custom_sized_box.dart';
import '../../shared_widgets/custom_text_button.dart';
import '../../shared_widgets/custom_text_form_field.dart';
import '../../shared_widgets/form_item_widget.dart';
import '../../shared_widgets/primary_color_elevated_button.dart';
import '../../shared_widgets/save_address_as_a_default_check.dart';

class ConfirmLocationBottomSheet extends StatefulWidget {
  const ConfirmLocationBottomSheet({super.key});

  @override
  State<ConfirmLocationBottomSheet> createState() =>
      _ConfirmLocationBottomSheetState();
}

class _ConfirmLocationBottomSheetState
    extends State<ConfirmLocationBottomSheet> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    AddressCubit cubit = AddressCubit.get(context);
    cubit.confirmLocationDetails.text =
        cubit.locationDetails?.formattedAddress ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddressCubit cubit = AddressCubit.get(context);
    final messenger = ScaffoldMessenger.of(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: BlocConsumer<AddressCubit, AddressState>(
              listener: (context, state) {
                if(state is PostAddressLoading){
                  showProgressIndicator(context);
                }
                if(state is PostAddressSuccess){
                  Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayoutScreen, (route) => false);
                  messenger.showSnackBar(customSnackBar(context, text: state.addressResponseEntity.message??""));
                  cubit.getAddressList();
                }
                if(state is PostAddressError){
                  messenger.showSnackBar(customSnackBar(context, text: state.error??""));
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                // AddressCubit cubit = AddressCubit.get(context);
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Location",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 16.sp),
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
                      controller: cubit.confirmLocationLabel,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "يجب ادخال العنوان";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "EX: 25 ST - Wadi Ad-Dawasir",
                      controller: cubit.confirmLocationDetails,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "يجب ادخال الوصف";
                        } else {
                          return null;
                        }
                      },
                      // controller: TextEditingController(
                      //   text: "25 ST - Wadi Ad-Dawasir - Riyadh",
                      // ),
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    FormItemWidget(
                      title: "Floor Number",
                      controller: cubit.confirmLocationFloorNumber,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "يجب ادخال رقم الطابق";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      hintText: "EX: 4 ( optional )",
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                    FormItemWidget(
                      title: "Flat Number",
                      controller: cubit.confirmLocationFlatNumber,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "يجب ادخال رقم الشقه او السكن";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      hintText: "EX: 4 ( optional )",
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
                        if (formKey.currentState!.validate()) {
                          cubit.postAddress(
                            AddressParameters(
                              id: null,
                              lable: cubit.confirmLocationLabel.text,
                              area: cubit.confirmLocationDetails.text,
                              details: cubit.confirmLocationDetails.text,
                              floorNumber:
                                  cubit.confirmLocationFloorNumber.text,
                              flatNumber: cubit.confirmLocationFlatNumber.text,
                              isDefault: cubit.isDefault,
                              userId: 20,
                            ),
                          );
                        }
                      },
                      text: "Confirm",
                    ),
                    const CustomSizedBox(
                      height: 16,
                    ),
                  ],
                );
              },
            ),
          ),
        ).symmetricPadding(horizontal: 16),
      ),
    );
  }
}
