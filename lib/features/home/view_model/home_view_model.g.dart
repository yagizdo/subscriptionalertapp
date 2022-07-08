// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$subsListAtom =
      Atom(name: 'HomeViewModelBase.subsList', context: context);

  @override
  ObservableList<SubsModel> get subsList {
    _$subsListAtom.reportRead();
    return super.subsList;
  }

  @override
  set subsList(ObservableList<SubsModel> value) {
    _$subsListAtom.reportWrite(value, super.subsList, () {
      super.subsList = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: 'HomeViewModelBase.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'HomeViewModelBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'HomeViewModelBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'HomeViewModelBase.price', context: context);

  @override
  String? get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String? value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$selectedColorIndexAtom =
      Atom(name: 'HomeViewModelBase.selectedColorIndex', context: context);

  @override
  int get selectedColorIndex {
    _$selectedColorIndexAtom.reportRead();
    return super.selectedColorIndex;
  }

  @override
  set selectedColorIndex(int value) {
    _$selectedColorIndexAtom.reportWrite(value, super.selectedColorIndex, () {
      super.selectedColorIndex = value;
    });
  }

  late final _$colorListAtom =
      Atom(name: 'HomeViewModelBase.colorList', context: context);

  @override
  List<int> get colorList {
    _$colorListAtom.reportRead();
    return super.colorList;
  }

  @override
  set colorList(List<int> value) {
    _$colorListAtom.reportWrite(value, super.colorList, () {
      super.colorList = value;
    });
  }

  late final _$typeAtom =
      Atom(name: 'HomeViewModelBase.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$dateTimeAtom =
      Atom(name: 'HomeViewModelBase.dateTime', context: context);

  @override
  String? get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(String? value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  late final _$addSubscriptionAsyncAction =
      AsyncAction('HomeViewModelBase.addSubscription', context: context);

  @override
  Future<bool> addSubscription() {
    return _$addSubscriptionAsyncAction.run(() => super.addSubscription());
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  dynamic getSubsList() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.getSubsList');
    try {
      return super.getSubsList();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateForm() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.validateForm');
    try {
      return super.validateForm();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subsList: ${subsList},
formKey: ${formKey},
name: ${name},
description: ${description},
price: ${price},
selectedColorIndex: ${selectedColorIndex},
colorList: ${colorList},
type: ${type},
dateTime: ${dateTime}
    ''';
  }
}
