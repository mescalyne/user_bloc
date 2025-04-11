// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:userlist_app/core/services/implementations/dio_network_service.dart'
    as _i564;
import 'package:userlist_app/core/services/implementations/secure_storage_service.dart'
    as _i745;
import 'package:userlist_app/core/services/interfaces/network_service.dart'
    as _i75;
import 'package:userlist_app/core/services/interfaces/storage_service.dart'
    as _i882;
import 'package:userlist_app/features/user/data/repositories/implementations/user_repository_impl.dart'
    as _i695;
import 'package:userlist_app/features/user/data/repositories/interfaces/user_repository.dart'
    as _i713;
import 'package:userlist_app/features/user/presentation/logic/user_bloc.dart'
    as _i540;

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
    gh.factory<_i882.StorageService>(() => _i745.SecureStorageService());
    gh.factory<_i713.UserRepository>(
        () => _i695.UserRepositoryImpl(gh<_i564.DioNetworkService>()));
    gh.factory<_i540.UserPageBloc>(
        () => _i540.UserPageBloc(gh<_i713.UserRepository>()));
    gh.factory<_i75.NetworkService>(
        () => _i564.DioNetworkService(gh<_i361.Dio>()));
    return this;
  }
}
