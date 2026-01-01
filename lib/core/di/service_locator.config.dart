// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:recliq_user/features/auth/data/repositories/auth_repository_impl.dart'
    as _i260;
import 'package:recliq_user/features/auth/domain/repositories/auth_repository.dart'
    as _i307;
import 'package:recliq_user/features/auth/presentation/mobx/auth_store.dart'
    as _i668;

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
    gh.factory<_i307.AuthRepository>(() => _i260.AuthRepositoryImpl());
    gh.factory<_i668.AuthStore>(
        () => _i668.AuthStore(gh<_i307.AuthRepository>()));
    return this;
  }
}
