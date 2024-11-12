import 'package:e_commerce/features/domain/entities/login_mode_entity.dart';

import 'package:e_commerce/features/domain/failuers.dart';

class LoginStates {}

class LoginIntileState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failuers failuers;

  LoginErrorState({required this.failuers});
}

class LoginSucsessState extends LoginStates {
  LoginModeEntity loginModeEntity;
  LoginSucsessState({required this.loginModeEntity});
}
