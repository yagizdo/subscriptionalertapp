import 'package:easy_localization/easy_localization.dart';

Future<void> localizationInit() async {
  await EasyLocalization.ensureInitialized();
  //to disable unnecessary logs
  EasyLocalization.logger.enableBuildModes = [];
}
