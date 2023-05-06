import 'package:store/link_api.dart';

import '../../../../Core/Class/crud.dart';

class SigninData {
  Crud crud;
  SigninData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.signinLink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
