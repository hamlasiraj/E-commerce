import 'package:flutter/material.dart';
import 'package:store/Core/Constant/colors.dart';

class LangImg extends StatelessWidget {
  final String putFlag;
  final void Function()? onTap;
  const LangImg({super.key, required this.putFlag, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.asset(fit: BoxFit.cover, putFlag),
        ),
      ),
    );
  }
}
