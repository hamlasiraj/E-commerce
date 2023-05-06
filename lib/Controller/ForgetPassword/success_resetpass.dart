import 'package:get/get.dart';
import 'package:store/Core/Constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToSignin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToSignin() {
    Get.offNamed(AppRoutes.signin);
  }
}
