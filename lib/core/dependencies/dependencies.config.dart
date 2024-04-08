// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i7;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:tv_maze_app/core/dependencies/modules/features/actors.module.dart'
    as _i19;
import 'package:tv_maze_app/core/dependencies/modules/features/tv_shows.module.dart'
    as _i18;
import 'package:tv_maze_app/core/dependencies/modules/packages/event_bus.module.dart'
    as _i15;
import 'package:tv_maze_app/core/dependencies/modules/packages/http_client.module.dart'
    as _i16;
import 'package:tv_maze_app/core/dependencies/modules/packages/navigation.module.dart'
    as _i17;
import 'package:tv_maze_app/core/dependencies/modules/packages/package_info.module.dart'
    as _i14;
import 'package:tv_maze_app/core/dependencies/modules/packages/storage.module.dart'
    as _i13;
import 'package:tv_maze_app/core/event_bus/event_bus.service.dart' as _i5;
import 'package:tv_maze_app/core/navigation/services/dialogs.service.dart'
    as _i11;
import 'package:tv_maze_app/core/navigation/services/navigation.service.dart'
    as _i10;
import 'package:tv_maze_app/features/actors/data/data/actors.repository.dart'
    as _i9;
import 'package:tv_maze_app/features/tv_shows/data/repositories/cloud_tv_shows.repository.dart'
    as _i8;
import 'package:tv_maze_app/features/tv_shows/data/repositories/local_tv_shows.repository.dart'
    as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final packageInfoModule = _$PackageInfoModule();
  final eventBusModule = _$EventBusModule();
  final httpClientModule = _$HttpClientModule();
  final navigationModule = _$NavigationModule();
  final tvShowsModule = _$TvShowsModule();
  final actorsModule = _$ActorsModule();
  await gh.singletonAsync<_i3.HiveInterface>(
    () => storageModule.hiveInterface(),
    preResolve: true,
  );
  await gh.singletonAsync<_i4.PackageInfo>(
    () => packageInfoModule.packageInfo(),
    preResolve: true,
  );
  gh.lazySingleton<_i5.EventBus>(() => eventBusModule.eventBus());
  gh.lazySingleton<_i6.Dio>(() => httpClientModule.appRouter());
  gh.lazySingleton<_i7.GoRouter>(() => navigationModule.appRouter());
  gh.lazySingleton<_i8.CloudTvShowsRepository>(
      () => tvShowsModule.cloudTvShowsRepository(gh<_i6.Dio>()));
  gh.lazySingleton<_i9.ActorsRepository>(
      () => actorsModule.actorsRepository(gh<_i6.Dio>()));
  gh.lazySingleton<_i10.AppNavigationService>(
      () => navigationModule.appNavigationService(gh<_i7.GoRouter>()));
  gh.lazySingleton<_i11.AppDialogsService>(
      () => navigationModule.appDialogsService(gh<_i7.GoRouter>()));
  gh.lazySingleton<_i12.LocalTvShowsRepository>(
      () => tvShowsModule.localTvShowsRepository(gh<_i3.HiveInterface>()));
  return getIt;
}

class _$StorageModule extends _i13.StorageModule {}

class _$PackageInfoModule extends _i14.PackageInfoModule {}

class _$EventBusModule extends _i15.EventBusModule {}

class _$HttpClientModule extends _i16.HttpClientModule {}

class _$NavigationModule extends _i17.NavigationModule {}

class _$TvShowsModule extends _i18.TvShowsModule {}

class _$ActorsModule extends _i19.ActorsModule {}
