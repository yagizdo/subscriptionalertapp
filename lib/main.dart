import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/init/local_database_init.dart';
import 'core/init/localization_init.dart';
import 'core/init/screen_util_init.dart';
import 'core/init/timezone_init.dart';

import 'core/constants/locale_constant.dart';
import 'core/constants/path_constant.dart';
import 'core/constants/string_constant.dart';
import 'core/init/service_locators_init.dart';
import 'core/services/local_notification/local_notification_service.dart';
import 'core/services/localization/localization_service.dart';
import 'core/services/route/route_service.dart';
import 'core/services/theme/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await screenUtilInit();
  await localizationInit();
  await localDatabaseInit();
  timezoneInit();
  serviceLocatorsInit();

  runApp(
    //localization
    EasyLocalization(
      supportedLocales: const [LocaleConstant.EN, LocaleConstant.TR],
      path: PathConstant.LANG,
      fallbackLocale: LocaleConstant.EN,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final localizationService =
      locator<LocalizationService>(param1: context);
  late final routeService = locator<RouteService>(param1: context);
  final themeService = locator<ThemeService>();
  final localNotificationService = locator<LocalNotificationService>();

  @override
  void initState() {
    super.initState();
    localNotificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    //screen adaptation
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        //material app
        return Observer(builder: (_) {
          return MaterialApp.router(
            title: StringConstant.APP_NAME,
            debugShowCheckedModeBanner: false,
            //theme
            theme: themeService.theme,
            themeMode: themeService.themeMode,
            darkTheme: themeService.themeDark,
            //route
            routeInformationParser:
                routeService.globalRoutes.routeInformationParser,
            routerDelegate: routeService.globalRoutes.routerDelegate,
            routeInformationProvider:
                routeService.globalRoutes.routeInformationProvider,
            //localization
            localizationsDelegates: localizationService.localizationDelegates,
            supportedLocales: localizationService.supportedLocales,
            locale: localizationService.locale,
          );
        });
      },
    );
  }
}
