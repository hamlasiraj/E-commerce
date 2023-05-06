import 'package:store/link_api.dart';

import '../../../../Core/Class/crud.dart';

class VerifyEmailData {
  Crud crud;
  VerifyEmailData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyemail, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendLink, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
