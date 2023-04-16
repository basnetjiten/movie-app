import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_online_course/feature/auth/data/models/registration_model.dart';
import 'package:flutter_online_course/feature/auth/data/register_repo_imp.dart';
import 'package:flutter_online_course/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';

part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : _registerRepoImpl = getIt<RegisterRepoImpl>(),
        super(RegisterState.initial()) {
    on<RegisterButtonClickEvent>(registerUser);
    on<LoginButtonClickEvent>(loginUser);
  }

  late final RegisterRepoImpl _registerRepoImpl;

  void registerUser(RegisterButtonClickEvent event, emit) async {

    emit(RegisteringState());

    final bool isCredentialStored = _registerRepoImpl.storeRegistrationData(
        registrationModel: event.registrationModel);

    if (isCredentialStored) {
      emit(RegisterState.success(message: 'someting'));
    }
  }

  void loginUser(LoginButtonClickEvent event, emit) {
    _registerRepoImpl.loginUser(
        username: event.username, password: event.password);

    print("here");
    emit(RegisteringState());
  }
}
