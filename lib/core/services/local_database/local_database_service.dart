import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../features/home/model/subs_model.dart';

import 'base/base_local_database_service.dart';

@singleton
class LocalDatabaseService extends BaseLocalDatabaseService {
  final subsBox = Hive.box<SubsModel>('subs');

  @override
  SubsModel? getSubsAt(int index) {
    return subsBox.getAt(index);
  }

  @override
  Future<void> addSubs(SubsModel subsModel) async {
    await subsBox.put(subsModel.id, subsModel);
  }

  @override
  Future<void> updateSubs(SubsModel subsModel) async {
    await subsModel.save();
  }

  @override
  Future<void> deleteSubs(SubsModel subsModel) async {
    await subsModel.delete();
  }

  final notifyBox = Hive.box('notify');

  @override
  getNotifyAt(int index) {
    return notifyBox.getAt(index);
  }

  @override
  Future<void> addNotify(String subsId, String notifyId) async {
    await notifyBox.put(subsId, notifyId);
  }

  @override
  Future<void> updateNotify(String subsId, String notifyId) async {
    await notifyBox.put(subsId, notifyId);
  }

  @override
  Future<void> deleteNotify(String subsId) async {
    await notifyBox.delete(subsId);
  }
  
 
}
