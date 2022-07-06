import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subs_model.g.dart';

@HiveType()
@JsonSerializable()
class SubsModel extends HiveObject {
  final String? id;
  final String? name;
  final String? description;
  final String? color;
  final double? price;
  final bool? annual;
  final bool? active;
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
