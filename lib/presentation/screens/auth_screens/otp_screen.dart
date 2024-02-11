import 'package:abyaty/core/constants/extensions.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_blurry_background.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/custom_sized_box.dart';
import 'package:abyaty/presentation/widgets/shared_widgets/primary_color_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth_screens_widgets/email_text_form_field.dart';
import '../../widgets/auth_screens_widgets/intro_image_title_widget.dart';
import '../../widgets/auth_screens_widgets/pin_field_builder.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              bodyText: "We have sent a code to your email. please enter the otp code.",
            ).symmetricPadding(horizontal: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomSizedBox(
                  height: 48,
                ),
                const PinFieldBuilder(),
                const CustomSizedBox(
                  height: 24,
                ),
                PrimaryColorElevatedButton(
                  onPressed: () {},
                  height: 48,
                  text: "Submit",
                ),
              ],
            ).symmetricPadding(horizontal: 16),

          ],
        ),
      ),
    );
  }
}
