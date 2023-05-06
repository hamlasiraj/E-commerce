import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Class/handlingdataview.dart';
import 'package:store/Core/Class/status_request.dart';
import 'package:store/Core/Constant/colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:store/Core/Constant/imageAssets.dart';
import 'package:store/Core/Function/valid_input.dart';
import 'package:store/View/Widget/Auth/text_row.dart';
import '../../../Controller/Auth/signup_controller.dart';
import '../../../Core/Function/exit_alert.dart';
import '../../Widget/Auth/auth_box.dart';
import '../../Widget/Auth/auth_button.dart';
import '../../Widget/Auth/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: exitAlert,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                Stack(children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: AppColor.primaryColor),
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
                            child: Column(children: [
                              const SizedBox(height: 15),
                              Text(
                                "17".tr,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                valid: (val) {
                                  return validInput(val!, 3, 50, "username");
                                },
                                myController: controller.username,
                                label: "18".tr,
                                icon: Icons.person_2_outlined,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                valid: (val) {
                                  return validInput(val!, 9, 100, "email");
                                },
                                myController: controller.email,
                                label: "12".tr,
                                icon: Icons.email_outlined,
                              ),
                              const SizedBox(height: 10),
                              GetBuilder<SignUpControllerImp>(
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
                              const SizedBox(height: 15),
                              AuthButton(
                                hint: "16".tr,
                                onPressed: () {
                                  controller.signUp();
                                },
                              ),
                              const SizedBox(height: 10),
                              TextRow(
                                textOne: "19".tr,
                                textTwo: "20".tr,
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ]),
            ),
          )),
    );
  }
}
