import 'package:flutter_online_course/core/utils/hive_storage.dart';
import 'package:flutter_online_course/feature/auth/data/models/registration_model.dart';

class RegisterSource {
  RegisterSource(this._hiveUtils);

  final HiveUtils _hiveUtils;

  bool registerUser({required RegistrationModel registrationModel}) {
    return _hiveUtils.registerUser(registrationModel: registrationModel);
  }

  bool checkCredential({required String username, required String password}) {
    final Map<String, dynamic> registeredUser = _hiveUtils.getUser();
    final String? hivePassword =
        RegistrationModel.fromJson(registeredUser).password;
    final String? hiveUsername =
        RegistrationModel.fromJson(registeredUser).username;

    if (username == hiveUsername && hivePassword == password) {
      return true;
    }
    return false;
  }
}
