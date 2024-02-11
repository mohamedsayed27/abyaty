import 'package:abyaty/core/app_router/screens_name.dart';
import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../buisness_logic/auth_cubit/auth_cubit.dart';
import '../../buisness_logic/auth_cubit/auth_state.dart';
import '../../widgets/auth_screens_widgets/email_text_form_field.dart';
import '../../widgets/auth_screens_widgets/intro_image_title_widget.dart';
import '../../widgets/auth_screens_widgets/password_text_form_field.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              bodyText: LocaleKeys.loginToAbyati,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if(state is LoginLoading){
                  showProgressIndicator(context);
                }
                if (state is LoginSuccess) {
                  Navigator.pop(context);
                  messenger.showSnackBar(
                    CustomSnackBar(
                      context,
                      text: state.loginEntity.message ?? "تم تسجيل الدخول بنجاح",
                      textAlign: TextAlign.center,
                      backgroundColor: AppColors.greenColor,
                    ),
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ScreenName.mainLayoutScreen,
                    (route) => false,
                  );
                }
                if (state is LoginError) {
                  Navigator.pop(context);
                  messenger.showSnackBar(
                    CustomSnackBar(
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
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CustomSizedBox(
                        height: 48,
                      ),
                      EmailTextFormField(
                        controller: cubit.loginEmailController,
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      PasswordTextFormField(
                        controller: cubit.loginPasswordController,
                      ),
                      const CustomSizedBox(
                        height: 16,
                      ),
                      InkWell(
                        child: Text(
                          LocaleKeys.forgotYourPassword.tr(),
                          style: CustomThemes.primaryColorTextTheme(context)
                              .copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ScreenName.forgotPasswordScreen);
                        },
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      PrimaryColorElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.login();
                          }
                        },
                        height: 48,
                        text: LocaleKeys.login.tr(),
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(),
                          ),
                          const CustomSizedBox(
                            width: 8,
                          ),
                          Text(
                            LocaleKeys.or.tr(),
                            textAlign: TextAlign.center,
                            style:
                                CustomThemes.introScreensBodyTextStyle(context)
                                    .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                          const CustomSizedBox(
                            width: 8,
                          ),
                          const Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      const CustomSizedBox(
                        height: 24,
                      ),
                      CustomOutlinedButton(
                        borderRadius: 12,
                        height: 56,
                        onPressed: () {},
                        foregroundColor: AppColors.primaryColor,
                        borderColor: AppColors.authHintTextColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              SvgPath.google,
                              width: 24.w,
                              height: 24.h,
                            ),
                            const CustomSizedBox(
                              width: 16,
                            ),
                            Text(
                              LocaleKeys.loginWithGmail.tr(),
                              style: CustomThemes.greyColorB3TextTheme(context)
                                  .copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                  "${LocaleKeys.notAMember.tr()} ",
                  style: CustomThemes.greyColor80TextTheme(context).copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  child: Text(
                    LocaleKeys.signUp.tr(),
                    style: CustomThemes.primaryColorTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, ScreenName.signUpScreen);
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
