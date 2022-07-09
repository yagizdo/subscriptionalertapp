import 'package:hive_flutter/hive_flutter.dart';
import '../constants/local_database_constant.dart';

import '../../features/home/model/subs_model.dart';

Future<void> localDatabaseInit() async {
  await Hive.initFlutter();

  //register adapter for model
  Hive.registerAdapter(SubsModelAdapter());

  //open boxes
  await Hive.openBox<SubsModel>(LocalDatabaseConstant.SUBS);
}
