import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../constants/local_database_constant.dart';
import '../../../features/home/model/subs_model.dart';

import 'base/base_local_database_service.dart';

@singleton
class LocalDatabaseService extends BaseLocalDatabaseService {
  final _subsBox = Hive.box<SubsModel>(
    LocalDatabaseConstant.SUBS,
  );

  int get subsBoxLength => _subsBox.length;

  @override
  SubsModel? getSubs(String subsId) {
    return _subsBox.get(subsId);
  }

  @override
  SubsModel? getSubsAt(int index) {
    return _subsBox.getAt(index);
  }

  @override
  Future<void> addSubs(SubsModel subsModel) async {
    await _subsBox.put(subsModel.id, subsModel);
  }

  @override
  Future<void> updateSubs(SubsModel subsModel) async {
    await subsModel.save();
  }

  @override
  Future<void> deleteSubs(SubsModel subsModel) async {
    await subsModel.delete();
  }

}
