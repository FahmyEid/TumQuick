import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,

    this.suffixIcon,
    this.keyboardType,
    this.isObscureText,
    required this.fillColor,
    required this.radius, required this.controller,
  });
  final String hint;

  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final Color fillColor;
  final double radius;
  final TextEditingController controller;
@override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller:controller ,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,

        hintText: hint,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
            borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
