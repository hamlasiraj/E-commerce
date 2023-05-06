import 'package:flutter/material.dart';

import '../../../Core/Constant/colors.dart';

class AuthBox extends StatelessWidget {
  final Widget? child;
  const AuthBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: AppColor.shadow, blurRadius: 5, spreadRadius: 0.5)
          ]),
      child: child,
    );
  }
}
