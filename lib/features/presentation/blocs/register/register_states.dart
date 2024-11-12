import 'package:e_commerce/features/domain/entities/register_model_entity.dart';
import 'package:e_commerce/features/domain/failuers.dart';

class RegisterStates {}

class IntinleState extends RegisterStates {}

class LoadingState extends RegisterStates {}

class ErrorState extends RegisterStates {
  Failuers failuers;

  ErrorState({required this.failuers});
}

class SucsessState extends RegisterStates {
  RegisterModelEntity registerModelEntity;
  SucsessState({required this.registerModelEntity});
}
