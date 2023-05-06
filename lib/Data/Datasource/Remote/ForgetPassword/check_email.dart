import 'package:store/link_api.dart';

import '../../../../Core/Class/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmailLink, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
