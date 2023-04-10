part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonClickEvent extends RegisterEvent{

  const RegisterButtonClickEvent({required this.userName,required this.password});

   final String userName;
   final String password;

  @override

  List<Object?> get props =>[userName,password];

}

class LoginButtonClickEvent extends RegisterEvent{

  const LoginButtonClickEvent(this.username,this.password);

  final String username;
  final String password;
  @override
  List<Object?> get props =>[username,password];
}

class RegistrationModel{
  late final String userName;
  late final String password;
  late final String firstName;
  late final String lastName;

}

