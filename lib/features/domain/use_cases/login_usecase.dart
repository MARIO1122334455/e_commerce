import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/domain/entities/login_mode_entity.dart';
import 'package:e_commerce/features/domain/failuers.dart';
import 'package:e_commerce/features/domain/repositories/authRepo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUsecase {
  AuthrepoContract authrepoContract;
  LoginUsecase({required this.authrepoContract});

  Future<Either<Failuers, LoginModeEntity>> invoke(
      String email, String password) {
    return authrepoContract.login(email, password);
  }
}
