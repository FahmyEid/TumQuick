import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/app_text_style.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/core/widgets/custom_material_button.dart';
import 'package:yumquick/core/widgets/custom_text_field.dart';
import 'package:yumquick/features/login/login_view.dart';
import 'package:yumquick/features/login/service/register_response.dart';
import 'package:yumquick/features/login/widgets/login_header.dart';
import 'package:yumquick/features/login/widgets/social_login_row.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

bool isObscureText = true;

class _SignUpViewState extends State<SignUpView> {
  bool isObscure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,

      body: SafeArea(
        child: Column(
          children: [
            LoginHeader(text: "Sign Up"),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(34),
                      Text(
                        "Full Name",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(8),
                      CustomTextFormField(
                        hint: "Enter Your Name",
                        fillColor: AppColors.yellow2,
                        radius: 12.r,
                        keyboardType: TextInputType.name,
                        controller: nameController,
                      ),
                      verticalSpace(8),
                      Text(
                        "Email",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        hint: "Enter Your Email",
                        fillColor: AppColors.yellow2,
                        radius: 12,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      verticalSpace(8),
                      Text(
                        "Password",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(8),
                      CustomTextFormField(
                        controller: passwordController,
                        hint: "Enter Your Password",
                        fillColor: AppColors.yellow2,
                        radius: 12,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: isObscureText
                              ? Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.orangeBase,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColors.orangeBase,
                                ),
                        ),
                        isObscureText: isObscureText,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      verticalSpace(8),
                      Text(
                        "confirm Password",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(8),
                      CustomTextFormField(
                        controller: confirmPasswordController,
                        hint: "confirm Password",
                        fillColor: AppColors.yellow2,
                        radius: 12,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: isObscureText
                              ? Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.orangeBase,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColors.orangeBase,
                                ),
                        ),
                        isObscureText: isObscureText,
                        keyboardType: TextInputType.visiblePassword,
                      ),

                      verticalSpace(8),

                      Center(
  child: isLoading
      ? CircularProgressIndicator(color: AppColors.orangeBase)
      : CustomMaterialButton(
          text: "Sign Up",
          onTap: () async {
            setState(() {
              isLoading = true;
            });

            final result = await registerUser(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              confirmPassword: confirmPasswordController.text.trim(),
            );

            setState(() {
              isLoading = false;
            });

            if (result != null && result.status.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(" Welcome, registered successfully!")),
              );

            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                
                SnackBar(content: Text("Sign Up failed")),
              );
            }
          },
          color: AppColors.orangeBase,
          textStyle: AppTextStyle.font24MediumleagueSpartanWhite,
          height: 50,
          width: 207,
          redius: 100,
        ),
)
,
                      verticalSpace(16),
                      Center(child: const Text('or sign up with')),
                      verticalSpace(12),

                      SocialLoginRow(),
                      verticalSpace(16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => LoginView()),
                              );
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: AppColors.orangeBase,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
