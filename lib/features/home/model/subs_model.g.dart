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
      color_1: fields[3] as int?,
      color_2: fields[4] as int?,
      price: fields[5] as String?,
      type: fields[6] as String?,
      active: fields[7] as bool?,
      paymentDate: fields[8] as String?,
      notifyId: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SubsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.color_1)
      ..writeByte(4)
      ..write(obj.color_2)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.active)
      ..writeByte(8)
      ..write(obj.paymentDate)
      ..writeByte(9)
      ..write(obj.notifyId);
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
      color_1: json['color_1'] as int?,
      color_2: json['color_2'] as int?,
      price: json['price'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
      paymentDate: json['paymentDate'] as String?,
      notifyId: json['notifyId'] as int?,
    );

Map<String, dynamic> _$SubsModelToJson(SubsModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color_1': instance.color_1,
      'color_2': instance.color_2,
      'price': instance.price,
      'type': instance.type,
      'active': instance.active,
      'paymentDate': instance.paymentDate,
      'notifyId': instance.notifyId,
    };
