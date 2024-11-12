import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/data/apiManger.dart';
import 'package:e_commerce/features/data/data_sources/authRemoteDataSourece.dart';
import 'package:e_commerce/features/data/endpoints.dart';
import 'package:e_commerce/features/data/models/login_modelDto.dart';
import 'package:e_commerce/features/data/models/register_modelDto.dart';
import 'package:e_commerce/features/domain/failuers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Authremotedatasourece)
class Authremotedatasoureceimpl implements Authremotedatasourece {
  Apimanger apimanger;
  Authremotedatasoureceimpl({required this.apimanger});

  @override
  Future<Either<Failuers, RegisterModelDto>> register(String name, String email,
      String password, String repassword, String phone) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apimanger.postData(Endpoints.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": repassword,
          "phone": phone
        });

        var registerResponse = RegisterModelDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return left(ServerError(errorMsg: registerResponse.message!));
        }
      } else {
        return left(NetWorkError(errorMsg: 'try again later'));
      }
    } catch (e) {
      return left(Failuers(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failuers, LoginModelDto>> login(
      String email, String password) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apimanger.postData(Endpoints.login, body: {
          "email": email,
          "password": password,
        });

        var loginModel = LoginModelDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginModel);
        } else {
          return left(ServerError(errorMsg: loginModel.message!));
        }
      } else {
        return left(NetWorkError(errorMsg: 'try again later'));
      }
    } catch (e) {
      return left(Failuers(errorMsg: e.toString()));
    }
  }
}
