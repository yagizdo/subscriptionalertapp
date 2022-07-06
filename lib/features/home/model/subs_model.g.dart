// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubsModel _$SubsModelFromJson(Map<String, dynamic> json) => SubsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      annual: json['annual'] as bool?,
      active: json['active'] as bool?,
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
    );

Map<String, dynamic> _$SubsModelToJson(SubsModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'price': instance.price,
      'annual': instance.annual,
      'active': instance.active,
      'paymentDate': instance.paymentDate?.toIso8601String(),
    };
