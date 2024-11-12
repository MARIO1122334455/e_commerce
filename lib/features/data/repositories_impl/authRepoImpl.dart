import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/data/data_sources/authRemoteDataSourece.dart';
import 'package:e_commerce/features/domain/entities/login_mode_entity.dart';
import 'package:e_commerce/features/domain/entities/register_model_entity.dart';
import 'package:e_commerce/features/domain/failuers.dart';
import 'package:e_commerce/features/domain/repositories/authRepo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthrepoContract)
class Authrepoimpl implements AuthrepoContract {
  Authremotedatasourece authremotedatasourece;
  Authrepoimpl({required this.authremotedatasourece});
  @override
  Future<Either<Failuers, RegisterModelEntity>> register(String name,
      String email, String password, String repassword, String phone) async {
    var either = await authremotedatasourece.register(
        name, email, password, repassword, phone);

    return either.fold((error) => left(error), (response) => right(response));
  }

  @override
  Future<Either<Failuers, LoginModeEntity>> login(
      String email, String password) async {
    var either = await authremotedatasourece.login(email, password);

    return either.fold((error) => left(error), (response) => right(response));
  }
}
