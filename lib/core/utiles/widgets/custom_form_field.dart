import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.keyboardType,
    this.validator,
    this.label,
    required this.controller,
  });
  final IconData? prefix;
  final IconData? suffix;
  final Function()? suffixPressed;
  final bool isPassword = false;
  final FormFieldSetter? onChanged;
  final Function()? onTap;
  final FormFieldSetter? onFieldSubmitted;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final String? label;
  final bool isUpperCase = false;
  final bool enabled = true;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: isUpperCase ? label!.toUpperCase() : label,
        border: const OutlineInputBorder(),
        prefix: SizedBox(
          height: 15.0,
          child: Icon(prefix),
        ),
        suffix: SizedBox(
          height: 15.0,
          child: IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffix),
          ),
        ),
      ),
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: isPassword,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
    );
  }
}
