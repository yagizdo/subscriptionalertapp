// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubsModelAdapter extends TypeAdapter<SubsModel> {
  @override
  final int typeId = 0;

  @override
  SubsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubsModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      color: fields[3] as String?,
      price: fields[4] as double?,
      annual: fields[5] as bool?,
      active: fields[6] as bool?,
      paymentDate: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SubsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.annual)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.paymentDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
