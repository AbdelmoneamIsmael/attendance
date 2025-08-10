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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const TranslateBootomSheet(),
              );
            },
            icon: const Icon(CupertinoIcons.globe),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: GetBuilder<LoginController>(
              builder: (controller) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign_in".tr,
                          style: AppTextStyles.bold(
                            context,
                          ).copyWith(fontSize: 24.sp),
                        ),
                        const SizedBox(),
                        AppTextField(
                          hint: "username".tr,
                          controller: controller.usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this_field_required".tr;
                            }
                            return null;
                          },
                        ),
                        AppTextField(
                          hint: "password".tr,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this_field_required".tr;
                            }
                            return null;
                          },
                          scure: controller.securePass,
                          controller: controller.passwordController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.changeScure();
                            },
                            icon: controller.securePass
                                ? const Icon(CupertinoIcons.eye_fill)
                                : const Icon(CupertinoIcons.eye_slash_fill),
                          ),
                        ),
                        const SizedBox(),
                        ElevatedButton(
                          onPressed: controller.loading
                              ? () {}
                              : controller.login,
                          child: (controller.loading)
                              ? const CircularProgressIndicator.adaptive(
                                  strokeWidth: 1,

                                  backgroundColor: Colors.white,
                                )
                              : Text("sign_in".tr),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
