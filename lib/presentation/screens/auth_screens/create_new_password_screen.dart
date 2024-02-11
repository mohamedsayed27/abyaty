import 'package:abyaty/core/app_theme/app_colors.dart';
import 'package:abyaty/core/assets_path/svg_path.dart';
import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_blurry_background.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/auth_screens_widgets/email_text_form_field.dart';
import '../../widgets/auth_screens_widgets/intro_image_title_widget.dart';
import '../../widgets/auth_screens_widgets/password_text_form_field.dart';
import '../../widgets/shared_widgets/custom_outlined_button.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomSizedBox(
                  height: 48,
                ),
                const PasswordTextFormField(),
                const CustomSizedBox(
                  height: 24,
                ),
                PasswordTextFormField(hintText: LocaleKeys.confirmPassword.tr()),
                const CustomSizedBox(
                  height: 24,
                ),
                PrimaryColorElevatedButton(
                  onPressed: () {},
                  height: 48,
                  text: LocaleKeys.submit.tr(),
                ),
              ],
            ).symmetricPadding(horizontal: 16),
          ],
        ),
      ),
    );
  }
}
