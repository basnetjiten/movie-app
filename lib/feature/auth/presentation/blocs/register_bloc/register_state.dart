part of 'register_bloc.dart';

@freezed
 class RegisterState with _$RegisterState {
  factory RegisterState.initial()= InitialState;
  factory RegisterState.success({required String message})= RegisterSuccessState;
  factory RegisterState.registering()= RegisteringState;
}
//
// class RegisterInitial extends RegisterState {
//   @override
//   List<Object> get props => [];
// }
//
// class RegisteringState extends RegisterState {
//   @override
//   List<Object> get props => [];
// }
//
// class RegisterSuccessState extends RegisterState {
//   const RegisterSuccessState();
//
//
//
//   @override
//   List<Object> get props => [];
// }
