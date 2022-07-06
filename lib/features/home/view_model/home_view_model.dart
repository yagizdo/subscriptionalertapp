import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constants/path_constant.dart';

part 'home_view_model.g.dart';

@lazySingleton
class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {




  @disposeMethod
  void dispose() {}
}
