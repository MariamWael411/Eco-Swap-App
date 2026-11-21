// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i923;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_cases/forget_pass_use_case.dart'
    as _i544;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/login_with_google_use_case.dart'
    as _i490;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/ui/common/cubit/login_with_google_cubit.dart'
    as _i620;
import '../../features/auth/ui/forget_password/cubit/forget_pass_cubit.dart'
    as _i508;
import '../../features/auth/ui/login/cubit/login_cubit.dart' as _i416;
import '../../features/auth/ui/register/cubit/register_cubit.dart' as _i539;
import '../../features/edit_profile/data/data_source/remote/edit_profile_remote_data_source.dart'
    as _i901;
import '../../features/edit_profile/data/data_source/remote/edit_profile_remote_data_source_impl.dart'
    as _i746;
import '../../features/edit_profile/data/repository/edit_profile_repository_impl.dart'
    as _i859;
import '../../features/edit_profile/domain/repository/edit_profile_repository.dart'
    as _i119;
import '../../features/edit_profile/domain/use_case/edit_profile_use_case.dart'
    as _i226;
import '../../features/edit_profile/ui/cubit/edit_profile_cubit.dart' as _i175;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i923.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i901.EditProfileRemoteDataSource>(
      () => _i746.EditProfileRemoteDataSourceImpl(),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i548.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i544.ForgetPassUseCase>(
      () => _i544.ForgetPassUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i490.LoginWithGoogleUseCase>(
      () => _i490.LoginWithGoogleUseCase(
        authRepository: gh<_i961.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i508.ForgetPassCubit>(
      () => _i508.ForgetPassCubit(
        forgetPassUseCase: gh<_i544.ForgetPassUseCase>(),
      ),
    );
    gh.factory<_i119.EditProfileRepository>(
      () => _i859.EditProfileRepositoryImpl(
        editProfileRemoteDataSource: gh<_i901.EditProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i416.LoginCubit>(
      () => _i416.LoginCubit(loginUseCase: gh<_i1038.LoginUseCase>()),
    );
    gh.factory<_i539.RegisterCubit>(
      () => _i539.RegisterCubit(registerUseCase: gh<_i1010.RegisterUseCase>()),
    );
    gh.factory<_i620.LoginWithGoogleCubit>(
      () => _i620.LoginWithGoogleCubit(
        loginWithGoogleUseCase: gh<_i490.LoginWithGoogleUseCase>(),
      ),
    );
    gh.lazySingleton<_i226.EditProfileUseCase>(
      () => _i226.EditProfileUseCase(
        editProfileRepository: gh<_i119.EditProfileRepository>(),
      ),
    );
    gh.factory<_i175.EditProfileCubit>(
      () => _i175.EditProfileCubit(
        editProfileUseCase: gh<_i226.EditProfileUseCase>(),
      ),
    );
    return this;
  }
}
