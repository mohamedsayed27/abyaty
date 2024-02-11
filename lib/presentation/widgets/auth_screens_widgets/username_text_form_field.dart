import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/custom_text_form_field.dart';

class UsernameTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  const UsernameTextFormField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: LocaleKeys.username.tr(),
      controller: controller,
      validator: (value) {
        if (value == null) {
          return "من فضلك ادخل الاسم";
        } else {
          return null;
        }
      },
    );
  }
}
