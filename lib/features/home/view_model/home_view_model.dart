import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../../core/constants/color_constant.dart';
import '../../../core/services/local_database/local_database_service.dart';
import '../../../core/services/local_notification/local_notification_service.dart';
import '../../../core/services/local_notification/model/local_notification_model.dart';
import 'package:uuid/uuid.dart';

import '../../../core/init/service_locators_init.dart';
import '../../../core/services/local_notification/local_notification_service.dart';
import '../model/subs_model.dart';

part 'home_view_model.g.dart';

@lazySingleton
class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final localDatabaseService = locator<LocalDatabaseService>();
  final localNotificationService = locator<LocalNotificationService>();

  @observable
  ObservableList<SubsModel> subsList = <SubsModel>[].asObservable();

  @action
  getSubsList() {
    if (localDatabaseService.subsBoxLength > 0) {
      for (int i = 0; i < localDatabaseService.subsBoxLength; i++) {
        var subsModel = localDatabaseService.getSubsAt(i)!;
        subsList.add(subsModel);
      }
    }
  }

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  String? name;

  @observable
  String? description;

  @observable
  String? price;

  @observable
  int selectedColorIndex = 0;

  final List<int> colorList = [
    ColorConstant.CITRUSPEEL_1,
    ColorConstant.EVENINGNIGHT_1,
    ColorConstant.SINCITYRED_1,
    ColorConstant.SLIGHTOCEANVIEW_1,
    ColorConstant.ULTRAVIOLET_1,
  ];

  @observable
  String type = "Monthly";

  @observable
  String? dateTime;

  @action
  bool validateForm() {
    bool? val = formKey.currentState?.validate();
    if (val == true) {
      formKey.currentState?.save();
      return true;
    }
    return false;
  }

  @action
  Future<bool> addSubscription() async {
    var subsModel = SubsModel(
        id: const Uuid().v1(),
        name: name,
        description: description ?? "",
        color_1: colorList[selectedColorIndex],
        color_2: (() {
          if (selectedColorIndex == 0) {
            return ColorConstant.CITRUSPEEL_2;
          }
          if (selectedColorIndex == 1) {
            return ColorConstant.EVENINGNIGHT_2;
          }
          if (selectedColorIndex == 2) {
            return ColorConstant.SINCITYRED_2;
          }
          if (selectedColorIndex == 3) {
            return ColorConstant.SLIGHTOCEANVIEW_2;
          }
          if (selectedColorIndex == 4) {
            return ColorConstant.ULTRAVIOLET_2;
          }
        }()),
        price: price,
        type: type,
        paymentDate: dateTime,
        active: true,
        notifyId: Random().nextInt(9999));

    bool isAddedLocalDatabase = await addLocalDatabase(subsModel);
    if (isAddedLocalDatabase) {
      bool isAddedLocalNotification = await addLocalNotification(subsModel);
      if (isAddedLocalNotification) {
        subsList.add(subsModel);
        subsModel = SubsModel();     
        return true;
      }
      return false;
    }

    return false;
  }

  Future<bool> addLocalDatabase(SubsModel subsModel) async {
    try {
      await localDatabaseService.addSubs(subsModel);

      return true;
    } catch (e) {
      debugPrint("Local Database Problem $e");
      return false;
    }
  }

  Future<bool> addLocalNotification(SubsModel subsModel) async {
    final localNotificationModel = LocalNotificationModel(
      //id must be uniq for all notifications
      id: subsModel.notifyId!,
      title: "Today is your payment for ${subsModel.name}",
      body: "Payment for ${subsModel.name} is ${subsModel.price}",
      //to show notification 5 secons later
      //or DateTime.parse(subsModel.paymentDate!),
      dateTime: DateTime.now().add(const Duration(seconds: 5)),
      payload: subsModel.id,
    );

    try {
      await localNotificationService.showScheduledNotification(
        localNotificationModel: localNotificationModel,
      );
      return true;
    } catch (e) {
      debugPrint("Local Notification Problem $e");
      return false;
    }
  }

  @disposeMethod
  void dispose() {}
}
