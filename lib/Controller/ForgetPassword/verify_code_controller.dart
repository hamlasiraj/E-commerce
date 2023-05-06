import 'package:get/get.dart';
import 'package:store/Core/Constant/routes.dart';

import '../../Core/Class/status_request.dart';
import '../../Core/Function/handling_data.dart';
import '../../Data/Datasource/Remote/ForgetPassword/verify_pass_code.dart';

abstract class VerifyCodePasswordController extends GetxController {
  late String verifyCode;

  checkCode();
  goToResetPassword(verificationCode);
}

class VerifyCodePasswordControllerImp extends VerifyCodePasswordController {
  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToResetPassword(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
