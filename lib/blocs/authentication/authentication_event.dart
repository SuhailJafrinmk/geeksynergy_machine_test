part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}
class SignInButtonClicked extends AuthenticationEvent{
  final UserModel userModel;
  SignInButtonClicked({required this.userModel});
}
class SignUpButtonClicked extends AuthenticationEvent{
  final UserModel userModel;
  SignUpButtonClicked({required this.userModel});
}

class SignOutButttonClickedEvent extends AuthenticationEvent{}