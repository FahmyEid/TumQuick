
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/app_assets.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/core/widgets/custom_text_field.dart';

class HeaderOfHomeView extends StatelessWidget {
  const HeaderOfHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.yellowBase,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hint: "Search products",
                  fillColor: AppColors.white,
                  radius: 30,
                  controller: TextEditingController(),
                  suffixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
             horizontalSpace(12),
               CircleAvatar(
                radius: 15.r,
                child: Image(
                  image: AssetImage(AppAssets.filterIcon),
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),verticalSpace(16),
           Text(
            "Good Morning ",
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold,color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
