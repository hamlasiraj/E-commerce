import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Controller/on_bording_ctr.dart';

import '../../../Core/Constant/colors.dart';
import '../../../Data/Datasource/Static/static.dart';

class OnBordingDotController extends StatelessWidget {
  const OnBordingDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBordingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 900),
                    width: controller.currentPage == index ? 20 : 5,
                    height: 6,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  )),
        ],
      ),
    );
  }
}
