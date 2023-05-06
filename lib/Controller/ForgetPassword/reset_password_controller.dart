import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Constant/routes.dart';

import '../../Core/Class/status_request.dart';
import '../../Core/Function/handling_data.dart';
import '../../Data/Datasource/Remote/ForgetPassword/reset_password.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();

  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  bool isShowPassword = true;
  bool isShowRePassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  showRePassword() {
    isShowRePassword = !isShowRePassword;
    update();
  }

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(title: "ُWarning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
