import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/colors.dart';
import '../../../Core/Constant/routes.dart';

class TextRow extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final Function()? onTap;
  const TextRow(
      {super.key, required this.textOne, required this.textTwo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
