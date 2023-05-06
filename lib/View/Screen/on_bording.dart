import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Controller/on_bording_ctr.dart';
import 'package:store/View/Widget/OnBording/dot_controller.dart';
import '../Widget/OnBording/custom_button.dart';
import '../Widget/OnBording/slider.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 4,
            child: OnBordingSlider(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                OnBordingDotController(),
                Spacer(flex: 2),
                OnBordingCustomButton()
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
