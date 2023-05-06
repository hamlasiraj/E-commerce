import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/Core/Localization/changelocal.dart';
import 'package:store/Core/Localization/translation.dart';
import 'package:store/Core/Services/services.dart';
import 'package:store/binding.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleConroller controller = Get.put(LocaleConroller());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
