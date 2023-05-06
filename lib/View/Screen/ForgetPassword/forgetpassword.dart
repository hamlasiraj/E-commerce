import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Class/handlingdataview.dart';
import 'package:store/Core/Constant/colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:store/Core/Constant/imageAssets.dart';
import 'package:store/Core/Function/valid_input.dart';
import '../../../Controller/ForgetPassword/forget_password_controller.dart';
import '../../Widget/Auth/auth_box.dart';
import '../../Widget/Auth/auth_button.dart';
import '../../Widget/Auth/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
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
                  child: AuthBox(
                    child: Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            "Check Email",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            valid: (val) {
                              return validInput(val!, 9, 100, "email");
                            },
                            myController: controller.email,
                            label: "12".tr,
                            icon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 15),
                          AuthButton(
                            hint: "Check",
                            onPressed: () {
                              controller.checkEmail();
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
