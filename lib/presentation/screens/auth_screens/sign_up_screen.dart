import 'package:abyaty/core/app_theme/custom_themes.dart';
import 'package:abyaty/core/constants/constants.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_blurry_background.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../buisness_logic/auth_cubit/auth_cubit.dart';
import '../../buisness_logic/auth_cubit/auth_state.dart';
import '../../widgets/auth_screens_widgets/email_text_form_field.dart';
import '../../widgets/auth_screens_widgets/intro_image_title_widget.dart';
import '../../widgets/auth_screens_widgets/password_text_form_field.dart';
import '../../widgets/auth_screens_widgets/terms_and_conditions_check_widget.dart';
import '../../widgets/auth_screens_widgets/username_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    return Scaffold(
      body: BlurryBackground(
        child: ListView(
          children: [
            const CustomSizedBox(
              height: 20,
            ),
            const IntroImageTitleWidget(
              bodyText: LocaleKeys.createNewPassword,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  messenger.showSnackBar(
                    customSnackBar(
                      context,
                      text: state.registerEntity.message ?? "تم التسجيل بنجاح",
                      textAlign: TextAlign.center,
                      backgroundColor: AppColors.greenColor,
                    ),
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ScreenName.loginScreen,
                    (route) => false,
                  );
                }
                if (state is RegisterError) {
                  messenger.showSnackBar(
                    customSnackBar(
                      context,
                      text: state.error,
                      textAlign: TextAlign.center,
                      backgroundColor: AppColors.errorBackgroundColor,
                    ),
                  );
                }
              },
              builder: (context, state) {
                AuthCubit cubit = AuthCubit.get(context);
                return Column(
                  children: [
                    const CustomSizedBox(
                      height: 48,
                    ),
                    UsernameTextFormField(
                      controller: cubit.usernameController,
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    EmailTextFormField(
                      controller: cubit.registerEmailController,
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    PasswordTextFormField(
                      controller: cubit.registerPasswordController,
                    ),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    const TermsAndConditionsCheckWidget(),
                    const CustomSizedBox(
                      height: 24,
                    ),
                    PrimaryColorElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.register();
                        }
                      },
                      height: 48,
                      text: LocaleKeys.submit.tr(),
                    ),
                  ],
                );
              },
            ).symmetricPadding(horizontal: 16),
            const CustomSizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${LocaleKeys.alreadyAMember.tr()} ",
                  style: CustomThemes.greyColor80TextTheme(context).copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  child: Text(
                    LocaleKeys.login.tr(),
                    style: CustomThemes.primaryColorTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ScreenName.loginScreen);
                  },
                )
              ],
            ),
            const CustomSizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
