import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/domain/entities/register_model_entity.dart';
import 'package:e_commerce/features/domain/failuers.dart';
import 'package:e_commerce/features/domain/repositories/authRepo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUsecase {
  AuthrepoContract authrepoContract;

  RegisterUsecase({required this.authrepoContract});

  Future<Either<Failuers, RegisterModelEntity>> invoke(String name,
      String email, String password, String repassword, String phone) {
    return authrepoContract.register(name, email, password, repassword, phone);
  }
}
