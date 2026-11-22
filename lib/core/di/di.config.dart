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

import '../../features/add_item/data/data_source/remote/item_remote_data_source.dart'
    as _i878;
import '../../features/add_item/data/data_source/remote/item_remote_data_source_impl.dart'
    as _i292;
import '../../features/add_item/data/repository/item_repository_impl.dart'
    as _i967;
import '../../features/add_item/domain/repository/item_repository.dart'
    as _i1070;
import '../../features/add_item/domain/use_cases/add_item_use_case.dart'
    as _i689;
import '../../features/add_item/domain/use_cases/delete_item_use_case.dart'
    as _i56;
import '../../features/add_item/domain/use_cases/edit_item_use_case.dart'
    as _i243;
import '../../features/add_item/domain/use_cases/get_filter_item_use_case.dart'
    as _i726;
import '../../features/add_item/domain/use_cases/get_item_use_case.dart'
    as _i1044;
import '../../features/add_item/domain/use_cases/update_user_item_use_case.dart'
    as _i775;
import '../../features/add_item/ui/cubit/item_cubit.dart' as _i1039;
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
import '../../features/home/data/data_source/remote/request_remote_data_source.dart'
    as _i30;
import '../../features/home/data/data_source/remote/request_remote_data_source_impl.dart'
    as _i944;
import '../../features/home/data/repository/request_repository_impl.dart'
    as _i81;
import '../../features/home/domain/repository/request_repository.dart' as _i65;
import '../../features/home/domain/use_case/add_request_use_case.dart' as _i903;
import '../../features/home/domain/use_case/delete_request_use_case.dart'
    as _i244;
import '../../features/home/domain/use_case/get_request_use_case.dart' as _i112;
import '../../features/home/domain/use_case/update_request_use_case.dart'
    as _i664;
import '../../features/home/ui/tabs/request/cubit/request_cubit.dart' as _i227;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i878.ItemRemoteDataSource>(
      () => _i292.ItemRemoteDataSourceImpl(),
    );
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i923.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i30.RequestRemoteDataSource>(
      () => _i944.RequestRemoteDataSourceImpl(),
    );
    gh.factory<_i901.EditProfileRemoteDataSource>(
      () => _i746.EditProfileRemoteDataSourceImpl(),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i548.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i1070.ItemRepository>(
      () => _i967.ItemRepositoryImpl(
        itemRemoteDataSource: gh<_i878.ItemRemoteDataSource>(),
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
    gh.factory<_i65.RequestRepository>(
      () => _i81.RequestRepositoryImpl(
        requestRemoteDataSource: gh<_i30.RequestRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i903.AddRequestUseCase>(
      () => _i903.AddRequestUseCase(
        requestRepository: gh<_i65.RequestRepository>(),
      ),
    );
    gh.lazySingleton<_i244.DeleteRequestUseCase>(
      () => _i244.DeleteRequestUseCase(
        requestRepository: gh<_i65.RequestRepository>(),
      ),
    );
    gh.lazySingleton<_i112.GetRequestUseCase>(
      () => _i112.GetRequestUseCase(
        requestRepository: gh<_i65.RequestRepository>(),
      ),
    );
    gh.lazySingleton<_i664.UpdateRequestUseCase>(
      () => _i664.UpdateRequestUseCase(
        requestRepository: gh<_i65.RequestRepository>(),
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
    gh.lazySingleton<_i689.AddItemUseCase>(
      () => _i689.AddItemUseCase(itemRepository: gh<_i1070.ItemRepository>()),
    );
    gh.lazySingleton<_i56.DeleteItemUseCase>(
      () => _i56.DeleteItemUseCase(itemRepository: gh<_i1070.ItemRepository>()),
    );
    gh.lazySingleton<_i243.EditItemUseCase>(
      () => _i243.EditItemUseCase(itemRepository: gh<_i1070.ItemRepository>()),
    );
    gh.lazySingleton<_i726.GetFilterItemUseCase>(
      () => _i726.GetFilterItemUseCase(
        itemRepository: gh<_i1070.ItemRepository>(),
      ),
    );
    gh.lazySingleton<_i1044.GetItemUseCase>(
      () => _i1044.GetItemUseCase(itemRepository: gh<_i1070.ItemRepository>()),
    );
    gh.lazySingleton<_i775.UpdateUserItemUseCase>(
      () => _i775.UpdateUserItemUseCase(
        itemRepository: gh<_i1070.ItemRepository>(),
      ),
    );
    gh.factory<_i227.RequestCubit>(
      () => _i227.RequestCubit(
        getRequestUseCase: gh<_i112.GetRequestUseCase>(),
        addRequestUseCase: gh<_i903.AddRequestUseCase>(),
        deleteRequestUseCase: gh<_i244.DeleteRequestUseCase>(),
        updateRequestUseCase: gh<_i664.UpdateRequestUseCase>(),
      ),
    );
    gh.factory<_i1039.ItemCubit>(
      () => _i1039.ItemCubit(
        deleteItemUseCase: gh<_i56.DeleteItemUseCase>(),
        addItemUseCase: gh<_i689.AddItemUseCase>(),
        editItemUseCase: gh<_i243.EditItemUseCase>(),
        getItemUseCase: gh<_i1044.GetItemUseCase>(),
        getFilterItemUseCase: gh<_i726.GetFilterItemUseCase>(),
        updateUserItemUseCase: gh<_i775.UpdateUserItemUseCase>(),
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
