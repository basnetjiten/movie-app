import 'package:flutter_online_course/core/utils/hive_storage.dart';

class RegisterSource {
  RegisterSource(this._hiveUtils);

  HiveUtils _hiveUtils;

  void registerUser({required String username, required String password}) {
    _hiveUtils.registerUser(username: username, password: password);
  }

  bool checkCredential({required String username, required String password}) {
    final String hiveUsername = _hiveUtils.getUserName();
    final String hivePassword = _hiveUtils.getPassword();

    if (username == hiveUsername && hivePassword == password) {
      return true;
    }
    return false;
  }
}
