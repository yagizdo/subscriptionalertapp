import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:subscriptionalertapp/core/services/local_database/local_database_service.dart';
import 'package:subscriptionalertapp/features/home/model/subs_model.dart';

import '../../../core/locators/locators.dart';
part 'single_subs_view_model.g.dart';

@lazySingleton
class SingleSubsViewModel = _SingleSubsViewModelBase with _$SingleSubsViewModel;

abstract class _SingleSubsViewModelBase with Store {
  final localDatabaseService = locator<LocalDatabaseService>();

  @observable
  SubsModel? subsModel;

  @action
  getSubsModel({Object? subsid, Object? subs}) {
    if (subs != null) {
      subsModel = subs as SubsModel;
    } else if (subsid != null) {
      subsModel = localDatabaseService.getSubs(subsid.toString());
    }
  }
}
