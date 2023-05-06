import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/Core/Constant/routes.dart';
import 'package:store/Core/Services/services.dart';
import 'package:store/Data/Datasource/Static/static.dart';

abstract class OnBordingContoller extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerImp extends OnBordingContoller {
  int currentPage = 0;
  late PageController pageController;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      myServices.sharedPreferences.setString("onBording", "1");
      Get.offAllNamed(AppRoutes.signin);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
