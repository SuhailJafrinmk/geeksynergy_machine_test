part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}
class AuthenticationInitial extends AuthenticationState{}
class SigninLoading extends AuthenticationState{}
class SignUpLoading extends AuthenticationState{}
class UserAuthenticationSuccess extends AuthenticationState{}
class UserAuthenticationFailed extends AuthenticationState{
  final String message;
  UserAuthenticationFailed({required this.message});
}
class NewUserSigned extends AuthenticationState{
  final UserModel userModel;
  NewUserSigned({required this.userModel});
}
class UserSignedOut extends AuthenticationState{}