import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Class/handlingdataview.dart';
import 'package:store/Core/Constant/colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:store/Core/Constant/imageAssets.dart';
import 'package:store/Core/Function/valid_input.dart';
import '../../../Controller/ForgetPassword/reset_password_controller.dart';
import '../../Widget/Auth/auth_box.dart';
import '../../Widget/Auth/auth_button.dart';
import '../../Widget/Auth/custom_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 230,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColor.primaryColor),
              ),
            ),
            Column(
              children: [
                Image.asset(height: 150, width: 150, AppImageAsset.logo),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: controller.formstate,
                    child: AuthBox(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            "Reset Password",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 20),
                          GetBuilder<ResetPasswordControllerImp>(
                            builder: (controller) => CustomTextField(
                              isPassword: controller.isShowPassword,
                              onTap: () {
                                controller.showPassword();
                              },
                              valid: (val) {
                                return validInput(val!, 8, 50, "password");
                              },
                              myController: controller.password,
                              label: "13".tr,
                              icon: Icons.lock_outline,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GetBuilder<ResetPasswordControllerImp>(
                            builder: (controller) => CustomTextField(
                              isPassword: controller.isShowRePassword,
                              onTap: () {
                                controller.showRePassword();
                              },
                              valid: (val) {
                                return validInput(val!, 8, 50, "password");
                              },
                              myController: controller.repassword,
                              label: "13".tr,
                              icon: Icons.lock_outline,
                            ),
                          ),
                          const SizedBox(height: 15),
                          AuthButton(
                            hint: "Confirm",
                            onPressed: () {
                              controller.goToSuccessResetPassword();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
