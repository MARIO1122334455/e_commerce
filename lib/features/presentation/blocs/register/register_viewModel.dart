import 'package:e_commerce/features/domain/use_cases/register_useCase.dart';
import 'package:e_commerce/features/presentation/blocs/register/register_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewmodel extends Cubit<RegisterStates> {
    RegisterUsecase registerUsecase;
  RegisterViewmodel({required this.registerUsecase}) : super(IntinleState());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();

  void register() async {
    emit(LoadingState());
    var either = await registerUsecase.invoke(
        nameController.text,
        emailController.text, 
        passwordController.text,
        rePasswordController.text,
        phoneController.text);

    either.fold((l) => emit(ErrorState(failuers: l)),
        (r) => emit(SucsessState(registerModelEntity: r)));
  }
}
