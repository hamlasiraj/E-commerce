import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:store/Controller/Auth/verifycodesignupcontroller.dart';
import 'package:store/Core/Class/handlingdataview.dart';
import 'package:store/Core/Constant/colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:store/Core/Constant/imageAssets.dart';
import '../../../Core/Class/status_request.dart';
import '../../Widget/Auth/auth_box.dart';
import '../../Widget/Auth/text_row.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
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
                          controller.goToSuccessSignUp(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(height: 10),
                      TextRow(
                        textOne: "Dind't get verification code? ",
                        textTwo: "Resend",
                        onTap: () {
                          controller.resend();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
