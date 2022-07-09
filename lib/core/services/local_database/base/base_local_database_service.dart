import '../../../../features/home/model/subs_model.dart';

abstract class BaseLocalDatabaseService {
  SubsModel? getSubs(String subsId);
  SubsModel? getSubsAt(int index);
  Future<void> addSubs(SubsModel subsModel);
  Future<void> updateSubs(SubsModel subsModel);
  Future<void> deleteSubs(SubsModel subsModel);
}
