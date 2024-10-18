import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:machine_test_geeksynergy/data/hive/hive_helper.dart';
import 'package:machine_test_geeksynergy/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
  on<SignInButtonClicked>(signInButtonClicked);
  on<SignUpButtonClicked>(signUpButtonClicked);
  on<SignOutButttonClickedEvent>(signOutButttonClickedEvent);
  }

  FutureOr<void> signInButtonClicked(SignInButtonClicked event, Emitter<AuthenticationState> emit)async{
    emit(SigninLoading());
   final bool isUserExist=HiveHelper().authenticateUser(event.userModel.userEmail, event.userModel.userPassword!);
   if(isUserExist==true){
    await HiveHelper().setUserSignedIn(true);
    emit(UserAuthenticationSuccess());
   }else{
    emit(UserAuthenticationFailed(message: 'Invalid credetials'));
   }
  }

  FutureOr<void> signUpButtonClicked(SignUpButtonClicked event, Emitter<AuthenticationState> emit)async{
    emit(SignUpLoading());
    final response=await HiveHelper().addUser(event.userModel);
    response.fold(ifLeft: (failure){
    emit(UserAuthenticationFailed(message: failure));
    }, ifRight: (success)async{
      emit(NewUserSigned(userModel: success));
      await HiveHelper().setUserSignedIn(true);
    });
  }


  FutureOr<void> signOutButttonClickedEvent(SignOutButttonClickedEvent event, Emitter<AuthenticationState> emit)async{
    emit(UserSignedOut());
    await HiveHelper().setUserSignedIn(false);
  }
}
