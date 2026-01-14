import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/app_assets.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/app_string.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/core/widgets/custom_material_button.dart';
import 'package:yumquick/features/login/login_view.dart';
import 'package:yumquick/features/login/sign_up_view.dart';

class LoginOrSignupView extends StatelessWidget {
  const LoginOrSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeBase,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 46.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(280),

            SvgPicture.asset(AppAssets.yellowAppLogo),
            verticalSpace(30.4),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.welcomMassage,
                textAlign: TextAlign.center,
              ),
            ),

            verticalSpace(29),
            CustomMaterialButton(
              text: "Log In",
              color: AppColors.yellowBase,
              textStyle: TextStyle(color: AppColors.orangeBase),
              height: 45,
              width: 207,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginView()),
                );
              },
              redius: 30,
            ),
            verticalSpace(4),
            CustomMaterialButton(
              text: "Sign Up",
              color: AppColors.yellow2,
              textStyle: TextStyle(color: AppColors.orangeBase),
              height: 45,
              width: 207,
              onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpView()),
                );
              },
              redius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
