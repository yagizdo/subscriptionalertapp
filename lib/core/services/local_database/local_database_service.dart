import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:subscriptionalertapp/features/home/model/subs_model.dart';

import 'base/base_local_database_service.dart';

@singleton
class LocalDatabaseService extends BaseLocalDatabaseService {



  final box = Hive.box<SubsModel>('subs');

  @override
  SubsModel? get(String subsId) {
    return box.get(subsId);
  }

  @override
  Future<void> add(SubsModel subsModel) async {
    await box.put(subsModel.id, subsModel);
  }

  @override
  Future<void> update(SubsModel subsModel) async {
    await subsModel.save();
  }

  @override
  Future<void> delete(SubsModel subsModel) async {
    await subsModel.delete();
  }
}
