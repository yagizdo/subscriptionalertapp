import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/locale_constant.dart';
import 'base/base_localization_service.dart';

@injectable
class LocalizationService implements BaseLocalizationService {
  LocalizationService(
    @factoryParam this._context,
  ) {
    localization = EasyLocalization.of(_context);
  }

  final BuildContext _context;
  late final dynamic localization;

  get supportedLocales => [LocaleConstant.EN, LocaleConstant.TR];
  get locale => localization?.locale;
  get localizationDelegates => localization?.delegates;

  @override
  void changeLang() {
    if (locale == LocaleConstant.EN) {
      localization.setLocale(LocaleConstant.TR);
    } else {
      localization.setLocale(LocaleConstant.EN);
    }
  }
}
