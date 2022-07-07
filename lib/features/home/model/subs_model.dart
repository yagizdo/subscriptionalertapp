import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subs_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class SubsModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final int? color_1;

  @HiveField(4)
  final int? color_2;

  @HiveField(5)
  final String? price;

  @HiveField(6)
  final String? type;

  @HiveField(7)
  final bool? active;

  @HiveField(8)
  final String? paymentDate;

  SubsModel({
    this.id,
    this.name,
    this.description,
    this.color_1,
    this.color_2,
    this.price,
    this.type,
    this.active,
    this.paymentDate,
  });

  factory SubsModel.fromJson(Map<String, dynamic> json) =>
      _$SubsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubsModelToJson(this);

  

  @override
  String toString() {
    return 'SubsModel(id: $id, name: $name, description: $description, color_1: $color_1, color_2: $color_2, price: $price, type: $type, active: $active, paymentDate: $paymentDate)';
  }
}
