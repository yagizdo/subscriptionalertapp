// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/view_model/home_view_model.dart' as _i3;
import '../../features/init/view_model/init_view_model.dart' as _i4;
import '../../features/single_subs/view_model/single_subs_view_model.dart'
    as _i10;
import '../services/local_database/local_database_service.dart' as _i5;
import '../services/local_notification/local_notification_service.dart' as _i6;
import '../services/localization/localization_service.dart' as _i7;
import '../services/route/route_service.dart' as _i9;
import '../services/theme/theme_service.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HomeViewModel>(() => _i3.HomeViewModel());
  gh.lazySingleton<_i4.InitViewModel>(() => _i4.InitViewModel());
  gh.singleton<_i5.LocalDatabaseService>(_i5.LocalDatabaseService());
  gh.singleton<_i6.LocalNotificationService>(_i6.LocalNotificationService());
  gh.factoryParam<_i7.LocalizationService, _i8.BuildContext, dynamic>(
      (_context, _) => _i7.LocalizationService(_context));
  gh.factoryParam<_i9.RouteService, _i8.BuildContext, dynamic>(
      (_context, _) => _i9.RouteService(_context));
  gh.lazySingleton<_i10.SingleSubsViewModel>(() => _i10.SingleSubsViewModel());
  gh.singleton<_i11.ThemeService>(_i11.ThemeService());
  return get;
}
