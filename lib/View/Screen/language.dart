import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Constant/routes.dart';
import 'package:store/Core/Localization/changelocal.dart';
import '../../Core/Constant/imageAssets.dart';
import '../Widget/lang_img.dart';

class Language extends GetView<LocaleConroller> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LangImg(
                onTap: () {
                  controller.changeLang("ar");
                  Get.offNamed(AppRoutes.onBording);
                },
                putFlag: AppImageAsset.languageImageone,
              ),
              SizedBox(width: 20),
              LangImg(
                onTap: () {
                  controller.changeLang("en");
                  Get.offNamed(AppRoutes.onBording);
                },
                putFlag: AppImageAsset.languageImageTwo,
              )
            ],
          )
        ],
      ),
    );
  }
}
