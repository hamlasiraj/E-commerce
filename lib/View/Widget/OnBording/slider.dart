import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Controller/on_bording_ctr.dart';
import '../../../Core/Constant/colors.dart';
import '../../../Data/Datasource/Static/static.dart';

class OnBordingSlider extends GetView<OnBordingControllerImp> {
  const OnBordingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBordingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  fit: BoxFit.contain,
                  onBordingList[i].image!,
                  width: double.infinity,
                  height: 200,
                ),
                const SizedBox(height: 40),
                Text(
                  onBordingList[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.black),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBordingList[i].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        height: 1.5,
                        color: AppColor.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ));
  }
}
