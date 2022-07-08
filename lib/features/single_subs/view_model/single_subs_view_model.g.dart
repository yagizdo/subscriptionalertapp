// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_subs_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingleSubsViewModel on _SingleSubsViewModelBase, Store {
  late final _$subsModelAtom =
      Atom(name: '_SingleSubsViewModelBase.subsModel', context: context);

  @override
  SubsModel? get subsModel {
    _$subsModelAtom.reportRead();
    return super.subsModel;
  }

  @override
  set subsModel(SubsModel? value) {
    _$subsModelAtom.reportWrite(value, super.subsModel, () {
      super.subsModel = value;
    });
  }

  late final _$_SingleSubsViewModelBaseActionController =
      ActionController(name: '_SingleSubsViewModelBase', context: context);

  @override
  dynamic getSubsModel({Object? subsid, Object? subs}) {
    final _$actionInfo = _$_SingleSubsViewModelBaseActionController.startAction(
        name: '_SingleSubsViewModelBase.getSubsModel');
    try {
      return super.getSubsModel(subsid: subsid, subs: subs);
    } finally {
      _$_SingleSubsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subsModel: ${subsModel}
    ''';
  }
}
