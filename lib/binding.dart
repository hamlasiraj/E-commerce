import 'package:get/get.dart';
import 'package:store/Core/Class/crud.dart';
import 'package:store/Data/Datasource/Remote/Auth/signup.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(SignupData);
  }
}
