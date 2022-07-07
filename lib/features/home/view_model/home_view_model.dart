import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:subscriptionalertapp/core/constants/color_constant.dart';
import 'package:subscriptionalertapp/core/services/local_database/local_database_service.dart';
import 'package:subscriptionalertapp/core/services/local_notification/local_notification_service.dart';
import 'package:subscriptionalertapp/core/services/local_notification/model/local_notification_model.dart';
import 'package:uuid/uuid.dart';

import '../../../core/locators/locators.dart';
import '../../../core/services/local_notification/local_notification_service.dart';
import '../model/subs_model.dart';

part 'home_view_model.g.dart';

@lazySingleton
class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final localDatabaseService = locator<LocalDatabaseService>();
  final localNotificationService = locator<LocalNotificationService>();

  @observable
  List<SubsModel> subsList = [];

  @action
  getSubsList() {
    for (int i = 0; i < localDatabaseService.subsBox.length; i++) {
      var subsModel = localDatabaseService.getSubsAt(i)!;
      subsList.add(subsModel);
      print(subsModel.toString());
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

  @observable
  List<int> colorList = [
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
    final subsModel = SubsModel(
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
    );

    bool isAddedLocalDatabase = await addLocalDatabase(subsModel);
    if (isAddedLocalDatabase) {
      bool isAddedLocalNotification = await addLocalNotification(subsModel);
      if (isAddedLocalNotification) {
        return true;
      }
      return false;
    }

    return false;
  }

  Future<bool> addLocalDatabase(SubsModel subsModel) async {
    try {
      await localDatabaseService.addSubs(subsModel);
      await localDatabaseService.addNotify(
          subsModel.id!, subsList.length.toString());
      return true;
    } catch (e) {
      print("Local Database Problem " + e.toString());
      return false;
    }
  }

  Future<bool> addLocalNotification(SubsModel subsModel) async {
    final localNotificationModel = LocalNotificationModel(
      id: subsList.length,
      title: "Today is your payment for ${subsModel.name}",
      body: "Payment for ${subsModel.name} is ${subsModel.price}",
      dateTime: DateTime.now()
          .add(Duration(seconds: 5)), //DateTime.parse(subsModel.paymentDate!),
      payload: subsModel.id,
    );

    try {
      await localNotificationService.showScheduledNotification(
        localNotificationModel: localNotificationModel,
      );
      return true;
    } catch (e) {
      print("Local Notification Problem " + e.toString());
      return false;
    }
  }

  @disposeMethod
  void dispose() {}
}
