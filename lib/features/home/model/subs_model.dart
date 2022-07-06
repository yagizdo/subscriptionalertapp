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
  final String? color;

  @HiveField(4)
  final double? price;

  @HiveField(5)
  final bool? annual;

  @HiveField(6)
  final bool? active;

  @HiveField(7)
  final DateTime? paymentDate;

  SubsModel(
      {this.id,
      this.name,
      this.description,
      this.color,
      this.price,
      this.annual,
      this.active,
      this.paymentDate});

  factory SubsModel.fromJson(Map<String, dynamic> json) =>
      _$SubsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubsModelToJson(this);
}
