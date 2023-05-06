import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:store/Core/Class/handlingdataview.dart';
import 'package:store/Core/Constant/colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:store/Core/Constant/imageAssets.dart';
import '../../../Controller/ForgetPassword/verify_code_controller.dart';
import '../../Widget/Auth/auth_box.dart';
import '../../Widget/Auth/text_row.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodePasswordControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodePasswordControllerImp>(
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
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          "Verification",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 40),
                        OtpTextField(
                          borderRadius: BorderRadius.circular(10),
                          cursorColor: AppColor.primaryColor,
                          focusedBorderColor: AppColor.primaryColor,
                          numberOfFields: 5,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToResetPassword(verificationCode);
                          }, // end onSubmit
                        ),
                      ],
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
