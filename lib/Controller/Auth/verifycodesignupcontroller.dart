import 'package:get/get.dart';
import 'package:store/Core/Class/status_request.dart';
import 'package:store/Core/Constant/routes.dart';
import 'package:store/Data/Datasource/Remote/Auth/verify_email.dart';

import '../../Core/Function/handling_data.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkEmail();
  goToSuccessSignUp(String verificationCode);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyEmailData verfiyCodeSignUpData = VerifyEmailData(Get.find());
  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkEmail() {}

  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignUpData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  resend() {
    verfiyCodeSignUpData.resendData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
