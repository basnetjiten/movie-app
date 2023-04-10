part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisteringState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends RegisterState {
  const RegisterSuccessState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
