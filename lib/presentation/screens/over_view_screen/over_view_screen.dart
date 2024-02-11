import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/assets_path/images_path.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/presentation/screens/profile_screens/edit_profile_screen.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_text_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/bottom_sheets/news_letter_bottom_sheet.dart';
import '../../widgets/shared_widgets/custom_app_bar.dart';
import '../../widgets/shared_widgets/data_widget.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  List<Map<String, dynamic>> itemsList = [
    {
      "containerColor": AppColors.sixthDummyColor,
      "iconColor": AppColors.primaryColor,
      "title": LocaleKeys.orders,
      "iconPath": SvgPath.moreBox,
      "number": "50"
    },
    {
      "containerColor": AppColors.ninthDummyColor,
      "iconColor": AppColors.boldGreyTextColor,
      "title": LocaleKeys.pendingOrders,
      "iconPath": SvgPath.boxTimer,
      "number": "08"
    },
    {
      "containerColor": AppColors.seventhDummyColor,
      "iconColor": Colors.red,
      "title": LocaleKeys.wishList,
      "iconPath": SvgPath.filledFavorite,
      "number": "120"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 63.h),
        child: const CustomAppBar(title: LocaleKeys.overview),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.h,
        ),
        children: [
          Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  ImagesPath.welcomeScreenImage,
                  fit: BoxFit.cover,
                ),
              ),
              const CustomSizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Mustafa 👋🏻",
                    style:
                        CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Take a look on your activity & history",
                    style: CustomThemes.greyColor80TextTheme(context)
                        .copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const CustomSizedBox(height: 24,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => Container(
                  width: 104.w,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: itemsList[index]["containerColor"],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        itemsList[index]["iconPath"],
                        width: 24.w,
                        height: 24.h,
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      Text(
                        itemsList[index]["number"],
                        style: CustomThemes.greyColo4DTextTheme(context)
                            .copyWith(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      const CustomSizedBox(
                        height: 8,
                      ),
                      Text(
                        itemsList[index]["title"].toString().tr(),
                        style: CustomThemes.greyColo4DTextTheme(context)
                            .copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 24,),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contact Information",
                      style:
                          CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 25.w,
                      child: CustomTextButton(
                        title: "Edit",
                        onPressed: () {
                          Navigator.pushNamed(context, ScreenName.editProfileScreen);
                        },
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 22,
                ),
                const DataWidget(
                  imagePath: SvgPath.moreUser,
                  title: 'Mustafa Emad',
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.sms,
                  title: 'mustafa@example.com',
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.phone,
                  title: '+966 10 12345678',
                ),
              ],
            ),
          ),
          const CustomSizedBox(height: 24,),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address Book",
                      style:
                          CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 25.w,
                      child: CustomTextButton(
                        title: "Edit",
                        onPressed: () {
                        },
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 22,
                ),
                const DataWidget(
                  imagePath: SvgPath.addressEdit,
                  title: 'Billing Address',
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                const AddressBookDetailsComponent(text: 'You haven’t set a billing address yet',),
                const CustomSizedBox(
                  height: 16,
                ),
                const DataWidget(
                  imagePath: SvgPath.shippingAddress,
                  title: 'Shipping Address',
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                const AddressBookDetailsComponent(text: '25 ST - Wadi Ad-Dawasir - Riyadh',isThereText: true),
              ],
            ),
          ),
          const CustomSizedBox(height: 24,),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.orderDestinationTypeWidget,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Newsletter ",
                      style:
                      CustomThemes.greyColor1ATextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 25.w,
                      child: CustomTextButton(
                        title: "Edit",
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (_)=>const NewsLetterBottomSheet(),isScrollControlled: true,);
                        },
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(height: 24,),
                Text(
                  "You are currently not subscribed to any newsletter",
                  textAlign: TextAlign.center,
                  style:
                  CustomThemes.greyColor99TextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class AddressBookDetailsComponent extends StatelessWidget {
  final String text;
  final bool isThereText;

  const AddressBookDetailsComponent({
    super.key,
    required this.text,
    this.isThereText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.favoriteButtonBackgroundGreyColoColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: isThereText
                  ? CustomThemes.greyColor1ATextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    )
                  : CustomThemes.greyColor80TextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ),
          SizedBox(
            height: 17.h,
            width: 17.w,
            child: IconButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)
              ),
              icon: SvgPicture.asset(
                SvgPath.edit,
                height: 16.h,
                width: 16.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
