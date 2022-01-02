import 'package:flutter/material.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField({
    Key? key,
    required final BuildContext context,
    final String? initialValue,
    final String? Function(String?)? validator,
    final FocusNode? focusNode,
    final Function(String?)? onSaved,
    final Function(String)? onFieldSubmitted,
    final Function(String)? onChanged,
    final TextEditingController? controller,
    final Widget? suffixIcon,
    final String? hintText,
    final Color? cursorColor,
    final TextInputAction? textInputAction,
  }) : super(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          textInputAction: textInputAction ?? TextInputAction.done,
          cursorColor: cursorColor ?? Colors.white,
          maxLines: 1,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefix: const Text('   '),
            isDense: true,
            hintText: hintText,
            hintStyle: context.textTheme.caption!.copyWith(
              color: Colors.white54,
            ),
            filled: true,
            fillColor: ColorConstants.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: context.borderRadius24x,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: context.borderRadius24x,
            ),
          ),
          style: context.textTheme.caption!,
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        );
}
