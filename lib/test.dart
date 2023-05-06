import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store/Core/Constant/colors.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Text"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: OtpTextField(
            cursorColor: AppColor.primaryColor,
            focusedBorderColor: AppColor.primaryColor,
            numberOfFields: 5,

            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {}, // end onSubmit
          ),
        ));
  }
}
