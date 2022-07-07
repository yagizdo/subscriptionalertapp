import '../../../../features/home/model/subs_model.dart';

abstract class BaseLocalDatabaseService {
  SubsModel? getSubsAt(int index);
  Future<void> addSubs(SubsModel subsModel);
  Future<void> updateSubs(SubsModel subsModel);
  Future<void> deleteSubs(SubsModel subsModel);

  getNotifyAt(int index);
  Future<void> addNotify(String subsId, String notifyId);
  Future<void> updateNotify(String subsId, String notifyId);
  Future<void> deleteNotify(String subsId);
}
