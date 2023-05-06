import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Controller/on_bording_ctr.dart';

import '../../../Core/Constant/colors.dart';

class OnBordingCustomButton extends GetView<OnBordingControllerImp> {
  const OnBordingCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: AppColor.primaryColor,
        child: Text("10".tr),
      ),
    );
  }
}
