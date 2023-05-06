import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Class/status_request.dart';
import 'package:store/Core/Constant/routes.dart';
import 'package:store/Core/Function/handling_data.dart';
import 'package:store/Data/Datasource/Remote/Auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await signupData.postData(username.text, email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.verifyEmail, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Already Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not valid");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.signin);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
