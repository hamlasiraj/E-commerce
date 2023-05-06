import 'package:store/link_api.dart';

import '../../../../Core/Class/crud.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyPassCodeLink, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
