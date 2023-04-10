import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_online_course/feature/auth/data/register_repo_imp.dart';
import 'package:flutter_online_course/main.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : _registerRepoImpl = getIt<RegisterRepoImpl>(),
        super(RegisterInitial()) {
    on<RegisterButtonClickEvent>(registerUser);
    on<LoginButtonClickEvent>(loginUser);
  }

  late final RegisterRepoImpl _registerRepoImpl;

  void registerUser(RegisterButtonClickEvent event, emit) async {
    final String? successMessage =
        await _registerRepoImpl.storeRegistrationData(
            username: event.userName, password: event.password);

    emit(RegisterSuccessState(successMessage!));
  }

  void loginUser(LoginButtonClickEvent event, emit) {
    _registerRepoImpl.loginUser(
        username: event.username, password: event.password);
  }
}
