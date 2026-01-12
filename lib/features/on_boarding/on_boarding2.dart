import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/app_assets.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/core/widgets/custom_material_button.dart';
import 'package:yumquick/features/login/login_view.dart';
import 'package:yumquick/features/on_boarding/on_boarding3.dart';

class onBoarding2 extends StatelessWidget {
  const onBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.onBoarding2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              verticalSpace(21),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: const Text("Skip >"),
                    ),
                  ),
                  horizontalSpace(35),
                ],
              ),
              verticalSpace(447),
              Expanded(
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpace(23),
                        Image.asset(AppAssets.cardIcon),
                        verticalSpace(20),
                        Text("Easy Payment"),
                        verticalSpace(19),
                        Text(
                          "Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(31),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 4.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: AppColors.yellow2,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            horizontalSpace(4),
                            Container(
                              height: 4.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: AppColors.orangeBase,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            horizontalSpace(4),
                            Container(
                              height: 4.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: AppColors.yellow2,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(32),
                        CustomMaterialButton(
                          text: "Next",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnBoarding3(),
                              ),
                            );
                          },
                          color: AppColors.orangeBase,
                          textStyle: TextStyle(),
                          height: 36,
                          width: 133,
                          redius: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
