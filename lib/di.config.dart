// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/data/apiManger.dart' as _i832;
import 'features/data/data_sources/authRemoteDataSourece.dart' as _i210;
import 'features/data/data_sources/authRemoteDataSoureceImpl.dart' as _i478;
import 'features/data/repositories_impl/authRepoImpl.dart' as _i605;
import 'features/domain/repositories/authRepo_contract.dart' as _i644;
import 'features/domain/use_cases/login_usecase.dart' as _i615;
import 'features/domain/use_cases/register_useCase.dart' as _i327;
import 'features/presentation/blocs/login/login_viewModel.dart' as _i242;
import 'features/presentation/blocs/register/register_viewModel.dart' as _i785;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i832.Apimanger>(() => _i832.Apimanger());
    gh.factory<_i210.Authremotedatasourece>(() =>
        _i478.Authremotedatasoureceimpl(apimanger: gh<_i832.Apimanger>()));
    gh.factory<_i644.AuthrepoContract>(() => _i605.Authrepoimpl(
        authremotedatasourece: gh<_i210.Authremotedatasourece>()));
    gh.factory<_i327.RegisterUsecase>(() =>
        _i327.RegisterUsecase(authrepoContract: gh<_i644.AuthrepoContract>()));
    gh.factory<_i615.LoginUsecase>(() =>
        _i615.LoginUsecase(authrepoContract: gh<_i644.AuthrepoContract>()));
    gh.factory<_i242.LoginViewmodel>(
        () => _i242.LoginViewmodel(loginUsecase: gh<_i615.LoginUsecase>()));
    gh.factory<_i785.RegisterViewmodel>(() =>
        _i785.RegisterViewmodel(registerUsecase: gh<_i327.RegisterUsecase>()));
    return this;
  }
}
