import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/app_fonts.dart';
import 'package:yumquick/core/utils/font_weight_helper.dart';

class AppTextStyle {
  static TextStyle font24BlackInterBlack = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.black,
    color: AppColors.orangeBase,
    fontFamily: AppFonts.inter,
  );
  static TextStyle font15SemiBoldleagueSpartanOrangeBase = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.orangeBase,
    fontFamily: AppFonts.leagueSpartan,
  );
  static TextStyle font14MediumleagueSpartanBlack = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black,
    fontFamily: AppFonts.leagueSpartan,
  );
  static TextStyle font17MediumleagueSpartanWhite = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
    fontFamily: AppFonts.leagueSpartan,
  );
    static TextStyle font24MediumleagueSpartanWhite = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
    fontFamily: AppFonts.leagueSpartan,
  );
    static TextStyle font20SemiBoldInterWhite = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
    fontFamily: AppFonts.inter,
  );
}
