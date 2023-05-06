import 'package:store/link_api.dart';

import '../../../../Core/Class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassLink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
