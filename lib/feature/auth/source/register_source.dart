import 'package:flutter_online_course/core/utils/hive_storage.dart';
import 'package:flutter_online_course/feature/auth/data/models/registration_model.dart';

class RegisterSource {
  RegisterSource(this._hiveUtils);

  HiveUtils _hiveUtils;

  bool registerUser({required RegistrationModel registrationModel}) {
    return _hiveUtils.registerUser(registrationModel: registrationModel);
  }

  bool checkCredential({required String username, required String password}) {
    final String hiveUsername = _hiveUtils.getUserName();
    final String hivePassword = _hiveUtils.getPassword();
    print("username and password ${hiveUsername} $hivePassword");

    if (username == hiveUsername && hivePassword == password) {
      return true;
    }
    return false;
  }
}
