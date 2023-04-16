part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonClickEvent extends RegisterEvent{

  const RegisterButtonClickEvent({required this.registrationModel});
  final RegistrationModel registrationModel;

  @override

  List<Object?> get props =>[registrationModel];

}

class LoginButtonClickEvent extends RegisterEvent{

  const LoginButtonClickEvent(this.username,this.password);

  final String username;
  final String password;
  @override
  List<Object?> get props =>[username,password];
}



