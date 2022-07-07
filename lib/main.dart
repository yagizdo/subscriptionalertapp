import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/route_constant.dart';
import 'features/home/model/subs_model.dart';

import 'core/constants/locale_constant.dart';
import 'core/constants/path_constant.dart';
import 'core/constants/string_constant.dart';
import 'core/locators/locators.dart';
import 'core/services/local_notification/local_notification_service.dart';
import 'core/services/localization/localization_service.dart';
import 'core/services/route/route_service.dart';
import 'core/services/theme/theme_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Screen size settings
  await ScreenUtil.ensureScreenSize();

  //init localization
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  //init local database
  await Hive.initFlutter();
  Hive.registerAdapter(SubsModelAdapter());
  await Hive.openBox<SubsModel>('subs');
  await Hive.openBox('notify');

  //init timezone for notification
  tz.initializeTimeZones();

  //setup locator
  configureLocators();

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
    localNotificationService.onNotifications.stream.listen(
      (payload) {
        routeService.pushWithArgs(
          route: RouteConstant.HOME,
          args: payload.toString(),
        );
      },
    );
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
            //routes
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
