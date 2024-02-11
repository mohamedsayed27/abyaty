import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_blurry_background.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/app_router/screens_name.dart';
import '../../widgets/auth_screens_widgets/email_text_form_field.dart';
import '../../widgets/auth_screens_widgets/intro_image_title_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              bodyText: LocaleKeys.forgotYourPasswordDoNotWorry,
            ).symmetricPadding(horizontal: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomSizedBox(
                  height: 48,
                ),
                const EmailTextFormField(),
                const CustomSizedBox(
                  height: 24,
                ),
                PrimaryColorElevatedButton(
                  onPressed: () {

                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayoutScreen,(route)=>false);
                  },
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
