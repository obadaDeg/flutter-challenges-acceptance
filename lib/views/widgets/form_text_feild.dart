import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';
import 'package:flutter_challenges_acceptance/utils/app_theme.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isVisible;
  final Function? onPressedVisibility;
  final Icon icon;

  const CustomFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.isVisible = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onPressedVisibility,
    this.icon = const Icon(Icons.email),
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        hintText: 'Enter your ${widget.labelText.toLowerCase()}',
        labelText: widget.labelText,
        fillColor: AppColors.surface,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.isVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.grey,
                ),
                onPressed: () => widget.onPressedVisibility?.call(),
              )
            : null,
      ),
      obscureText: widget.isPassword && !widget.isVisible,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}
