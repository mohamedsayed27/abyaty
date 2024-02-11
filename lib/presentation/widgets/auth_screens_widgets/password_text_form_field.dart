import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';
import '../shared_widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  const PasswordTextFormField({super.key, this.controller, this.hintText,});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isNotVisible = false;
  final FocusNode _focus = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocus);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onRemoveFocus);
    _focus.dispose();
  }

  void _onFocus() {
    isFocused = true;
    setState(() {});
  }

  void _onRemoveFocus() {
    isFocused = false;
    _focus.removeListener(_onRemoveFocus);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: widget.hintText??LocaleKeys.password.tr(),
      controller: widget.controller,
      isNotVisible: isNotVisible,
      focusNode: _focus,
      validator: (value) {
        if ((value??"").isEmpty) {
          return "من فضلك ادخل الرمز";
        } else if (value!.length<6) {
          return "يجب ان تكون اكثر من ٨ حروف";
        } else {
          return null;
        }
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isNotVisible = !isNotVisible;
          });
        },
        icon: Icon(
            isNotVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined, ),
      ),
    );
  }
}
