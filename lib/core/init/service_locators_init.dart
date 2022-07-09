import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../init/service_locators_init.config.dart';

final locator = GetIt.instance;  
  
@InjectableInit()
void serviceLocatorsInit() => $initGetIt(locator); 