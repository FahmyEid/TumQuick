import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/app_text_style.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 44.h,
        bottom: 59.h,
        right: 35.w,
        left: 35.w,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: AppColors.orangeBase),
          ),
          Spacer(),
          Text(
            text,
            style: AppTextStyle.font20SemiBoldInterWhite
          ),
          Spacer(),
        ],
      ),
    );
  }
}
