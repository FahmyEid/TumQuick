import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textStyle,
    required this.height,
    required this.width, required this.redius,
  });

  final String text;
  final VoidCallback? onTap;
  final Color color;
  final TextStyle textStyle;
  final double height;
  final double width;
  final double redius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(redius.r),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
