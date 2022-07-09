import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../features/init/view_model/init_view_model.dart';
import '../../init/service_locators_init.dart';
import 'base/base_theme_service.dart';

@singleton
class ThemeService implements BaseThemeService {
  final _initViewModel = locator<InitViewModel>();

  final ThemeData themeLight = FlexThemeData.light(
    scheme: FlexScheme.flutterDash,
    useMaterial3: true,
  );

  final ThemeData themeDark = FlexThemeData.dark(
    scheme: FlexScheme.flutterDash,
    useMaterial3: true,
  );

  ThemeMode get themeMode => _initViewModel.brightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;

  ThemeData get theme => themeMode == ThemeMode.dark ? themeDark : themeLight;

  TextTheme get textStyle => theme.textTheme;
}
