import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/app_text_style.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/core/widgets/custom_material_button.dart';
import 'package:yumquick/core/widgets/custom_text_field.dart';
import 'package:yumquick/features/home/home_view.dart';
import 'package:yumquick/features/login/service/login_user.dart';
import 'package:yumquick/features/login/sign_up_view.dart';
import 'package:yumquick/features/login/widgets/login_header.dart';
import 'package:yumquick/features/login/widgets/social_login_row.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordObscure = true;
  bool isLoading = false;
  bool validateInput() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: SafeArea(
        child: Column(
          children: [
            const LoginHeader(text: "Log In"),
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
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(8),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      verticalSpace(24),

                      Text(
                        "Email or Mobile Number",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(8),
                      CustomTextFormField(
                        controller: emailController,
                        hint: "Enter Your Email",
                        fillColor: AppColors.yellow2,
                        radius: 12,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      verticalSpace(16),

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
                        isObscureText: isPasswordObscure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordObscure = !isPasswordObscure;
                            });
                          },
                          icon: Icon(
                            isPasswordObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.orangeBase,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password',
                            style: TextStyle(color: AppColors.orangeBase),
                          ),
                        ),
                      ),
                      verticalSpace(16),

                      Center(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: AppColors.orangeBase,
                              )
                            : CustomMaterialButton(
                                text: "Log In",
                                onTap: () async {
                                  if (!validateInput()) return;

                                  setState(() {
                                    isLoading = true;
                                  });

                                  final result = await loginUser(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );

                                  setState(() {
                                    isLoading = false;
                                  });

                                  if (result != null &&
                                      result['token'] != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Welcome! Logged in successfully.",
                                        ),
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeView(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Login failed"),
                                      ),

                                    );
                                    
                                  }
                                },
                                color: AppColors.orangeBase,
                                textStyle:
                                    AppTextStyle.font24MediumleagueSpartanWhite,
                                height: 50,
                                width: 207,
                                redius: 100,
                              ),
                      ),
                      verticalSpace(16),

                      Center(child: const Text('or sign up with')),
                      verticalSpace(12),
                      SocialLoginRow(),
                      verticalSpace(16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUpView(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: AppColors.orangeBase,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(16),
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
