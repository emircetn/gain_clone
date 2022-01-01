import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/textformfield/app_text_form_field.dart';

class SearchTextFormField extends AppTextFormField {
  SearchTextFormField({
    Key? key,
    required final BuildContext context,
    final String? labelText,
    final String? Function(String?)? validator,
    final FocusNode? focusNode,
    final Function(String?)? onSaved,
    final Function(String)? onFieldSubmitted,
    final VoidCallback? searchTapped,
    final Function(String)? onChanged,
    final TextEditingController? controller,
    final IconButton? suffixIcon,
    final String? hintText,
  }) : super(
          context: context,
          key: key,
          controller: controller,
          focusNode: focusNode,
          textInputAction: TextInputAction.search,
          cursorColor: Colors.red,
          suffixIcon: GestureDetector(
            onTap: () => searchTapped,
            child: Icon(
              PhosphorIcons.magnifying_glass,
              color: Colors.white60,
              size: 20.sp,
            ),
          ),
          hintText: 'Arama',
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        );
}
