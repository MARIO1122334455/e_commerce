import 'package:e_commerce/features/domain/use_cases/login_usecase.dart';

import 'package:e_commerce/features/presentation/blocs/login/login_states.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewmodel extends Cubit<LoginStates> {
  LoginViewmodel({required this.loginUsecase}) : super(LoginIntileState());
  LoginUsecase loginUsecase;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUsecase.invoke(
      passwordController.text,
      emailController.text,
    );

    either.fold((l) => emit(LoginErrorState(failuers: l)),
        (r) => emit(LoginSucsessState(loginModeEntity: r)));
  }
}
