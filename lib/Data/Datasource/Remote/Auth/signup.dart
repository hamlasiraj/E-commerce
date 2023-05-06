import 'package:store/link_api.dart';

import '../../../../Core/Class/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String password) async {
    var response = await crud.postData(AppLink.signupLink, {
      "username": username,
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
