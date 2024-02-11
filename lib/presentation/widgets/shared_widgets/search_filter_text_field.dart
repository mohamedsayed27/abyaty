import 'package:abyaty/presentation/widgets/shared_widgets/search_bar_text_field.dart';
import 'package:abyaty/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/svg_path.dart';

class SearchFilterTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final String? hintText;
  final Color? filterIconColor;
  final Color? searchIconColor;
  final void Function()? onTap;
  final void Function()? onFilterTapped;
  final void Function()? onSearchTapped;
  final bool? autofocus;

  const SearchFilterTextField({
    super.key,
    this.controller,
    this.enabled = false,
    this.readOnly = false,
    this.onTap,
    this.onFilterTapped,
    this.onSearchTapped,
    this.autofocus = false,
    this.hintText,
    this.filterIconColor,
    this.searchIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBarTextField(
      enabled: enabled,
      controller: controller,
      readOnly: readOnly,
      autofocus: autofocus,
      onTap: onTap,
      hintText: hintText ?? "${LocaleKeys.search.tr()}...",
      suffixIcon: IconButton(
        onPressed: onFilterTapped,
        icon: SvgPicture.asset(
          SvgPath.filterIcon,
          colorFilter: ColorFilter.mode(
            filterIconColor ?? Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
      prefixIcon: IconButton(
        onPressed: onSearchTapped,
        icon: SvgPicture.asset(
          SvgPath.searchIcon,
          colorFilter: ColorFilter.mode(
            searchIconColor ?? Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
