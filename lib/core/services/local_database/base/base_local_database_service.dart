import '../../../../features/home/model/subs_model.dart';

abstract class BaseLocalDatabaseService {
  SubsModel? get(String subsId);
  Future<void> add(SubsModel subsModel);
  Future<void> update(SubsModel subsModel);
  Future<void> delete(SubsModel subsModel);
}
