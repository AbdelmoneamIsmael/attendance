import 'package:attendance/core/themes/styles/app_text_style.dart';
import 'package:attendance/core/widgets/app_text_field.dart';
import 'package:attendance/features/login_screen/presentation/controller/login_controller.dart';
import 'package:attendance/features/login_screen/presentation/view/translate_bootom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0C0E1B)
          : const Color(0xFFF8FAFC),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => const TranslateBootomSheet(),
                );
              },
              icon: Icon(
                CupertinoIcons.globe,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF0C0E1B),
                    const Color(0xFF1A1D3A),
                    const Color(0xFF2D3561),
                  ]
                : [
                    const Color(0xFFF8FAFC),
                    const Color(0xFFE2E8F0),
                    const Color(0xFFCBD5E1),
                  ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GetBuilder<LoginController>(
                builder: (controller) {
                  return Column(
                    children: [
                      SizedBox(height: 60.h),

                      // Hero Section
                      _buildHeroSection(context),

                      SizedBox(height: 50.h),

                      // Login Card
                      _buildLoginCard(context, controller),

                      SizedBox(height: 40.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Column(
      children: [
        // App Logo/Icon Container
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            CupertinoIcons.person_badge_plus,
            size: 40.sp,
            color: Colors.white,
          ),
        ),

        SizedBox(height: 24.h),

        // Welcome Text
        Text(
          "welcome_back".tr,
          style: AppTextStyles.bold(
            context,
          ).copyWith(fontSize: 32.sp, fontWeight: FontWeight.w800, height: 1.2),
        ),

        SizedBox(height: 8.h),

        Text(
          "sign_in_to_continue".tr,
          style: AppTextStyles.regular(context).copyWith(
            fontSize: 16.sp,
            color: Theme.of(
              context,
            ).textTheme.bodyMedium?.color?.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginCard(BuildContext context, LoginController controller) {
    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 60,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Username Field
            _buildModernTextField(
              context: context,
              hint: "username".tr,
              controller: controller.usernameController,
              prefixIcon: CupertinoIcons.person,
              validator: (value) {
                if (value!.isEmpty) {
                  return "this_field_required".tr;
                }
                return null;
              },
            ),

            SizedBox(height: 20.h),

            // Password Field
            _buildModernTextField(
              context: context,
              hint: "password".tr,
              controller: controller.passwordController,
              prefixIcon: CupertinoIcons.lock,
              isPassword: true,
              isSecure: controller.securePass,
              onToggleVisibility: controller.changeScure,
              validator: (value) {
                if (value!.isEmpty) {
                  return "this_field_required".tr;
                }
                return null;
              },
            ),

            SizedBox(height: 32.h),

            // Login Button
            _buildModernButton(context, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required BuildContext context,
    required String hint,
    required TextEditingController? controller,
    required IconData prefixIcon,
    bool isPassword = false,
    bool isSecure = false,
    VoidCallback? onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? isSecure : false,
        validator: validator,
        style: AppTextStyles.regular(
          context,
        ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.regular(context).copyWith(
            color: Theme.of(
              context,
            ).textTheme.bodyMedium?.color?.withOpacity(0.5),
            fontSize: 16.sp,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 16.w, right: 12.w),
            child: Icon(
              prefixIcon,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              size: 22.sp,
            ),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onToggleVisibility,
                  icon: Icon(
                    isSecure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withOpacity(0.6),
                    size: 20.sp,
                  ),
                )
              : null,
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.05)
              : Colors.grey.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
        ),
      ),
    );
  }

  Widget _buildModernButton(BuildContext context, LoginController controller) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: controller.loading ? null : controller.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: controller.loading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.arrow_right_circle,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "sign_in".tr,
                    style: AppTextStyles.bold(context).copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
