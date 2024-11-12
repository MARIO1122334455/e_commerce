import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/domain/entities/login_mode_entity.dart';
import 'package:e_commerce/features/domain/entities/register_model_entity.dart';
import 'package:e_commerce/features/domain/failuers.dart';

abstract class Authremotedatasourece {
  Future<Either<Failuers, RegisterModelEntity>> register(String name,
      String email, String password, String repassword, String phone);

  Future<Either<Failuers, LoginModeEntity>> login(
      String email, String password);
}
