import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/app_text_style.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/core/widgets/custom_material_button.dart';
import 'package:yumquick/features/login/login_or_signup_view.dart';
import 'package:yumquick/features/on_boarding/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  final bool isLast;
  final PageController controller;
  final int currentIndex;
  final int totalPages;

  const OnBoardingItem({
    super.key,
    required this.model,
    required this.controller,
    required this.currentIndex,
    required this.totalPages,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          model.image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        if (model.skip != null)
          Positioned(
            top: 40.h,
            right: 35.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginOrSignupView()),
                );
              },
              child: Text(
                model.skip!,
                style: AppTextStyle.font15SemiBoldleagueSpartanOrangeBase,
              ),
            ),
          ),

       
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(23),
                Image.asset(model.logo),
                verticalSpace(20),
                Text(
                  model.title,
                  style: AppTextStyle.font24BlackInterBlack,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(19),
                Text(
                  model.subTitle,
                  style: AppTextStyle.font14MediumleagueSpartanBlack,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(31),

               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    totalPages,
                    (i) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: _indicator(
                        i == currentIndex ? AppColors.orangeBase : AppColors.yellow2,
                      ),
                    ),
                  ),
                ),

                verticalSpace(32),
                CustomMaterialButton(
                  text: isLast ? "Get Started" : model.button,
                  onTap: () {
                    if (!isLast) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginOrSignupView()),
                      );
                    }
                  },
                  color: AppColors.orangeBase,
                  textStyle: AppTextStyle.font17MediumleagueSpartanWhite,
                  height: 36.h,
                  width: 200.w,
                  redius: 100,
                ),
                verticalSpace(24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _indicator(Color color) {
    return Container(
      height: 4.h,
      width: 20.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }
}