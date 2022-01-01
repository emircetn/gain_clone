import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class SearchTextFormField extends StatelessWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? searchTapped;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;

  final IconButton? suffixIcon;

  const SearchTextFormField({
    Key? key,
    this.labelText,
    this.validator,
    this.focusNode,
    this.onSaved,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.onChanged,
    this.controller,
    this.hintText,
    this.searchTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      cursorColor: Colors.red,
      maxLines: 1,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: GestureDetector(
          onTap: () => searchTapped,
          child: Icon(
            PhosphorIcons.magnifying_glass,
            color: Colors.white60,
            size: 20.sp,
          ),
        ),
        isDense: true,
        hintText: 'Arama',
        hintStyle: context.textTheme.caption!.copyWith(
          color: Colors.white54,
        ),
        filled: true,
        fillColor: ColorConstants.primaryColor,
        border: OutlineInputBorder(
          borderRadius: context.borderRadius16x,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: context.borderRadius16x,
        ),
      ),
      style: context.textTheme.caption!,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      key: key,
    );
  }
}
