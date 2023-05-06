import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool? isPassword;
  final void Function()? onTap;
  const CustomTextField(
      {super.key,
      required this.label,
      required this.icon,
      required this.myController,
      required this.valid,
      this.isPassword,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword == null || isPassword == false ? false : true,
      validator: valid,
      controller: myController,
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          suffixIcon: InkWell(child: Icon(icon), onTap: onTap)),
    );
  }
}
