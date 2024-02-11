import 'package:abyaty/core/constants/reg_exp.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  const EmailTextFormField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: LocaleKeys.email.tr(),
      controller: controller,
      validator: (value) {
        if ((value??"").isEmpty) {
          return "من فضلك ادخل البريد";
        } else if (!RegularExp.emailRegex.hasMatch((value??""))) {
          return "ادخل صيفة بريد صحيحة";
        } else {
          return null;
        }
      },
    );
  }
}
