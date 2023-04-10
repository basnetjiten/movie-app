import 'package:flutter_online_course/feature/auth/source/register_source.dart';

class RegisterRepoImpl {
  RegisterRepoImpl(this._registerSource);

  final RegisterSource _registerSource;

  /// Receives [username] and [password] from the bloc
  Future<String?> storeRegistrationData(
      {required String username, required String password}) {

    _registerSource.registerUser(username: username, password: password);
    print(username + password);
    throw ('data');
  }

  void loginUser({required String username, required String password}) {

    _registerSource.checkCredential(username:username,password:password);

  }
}
