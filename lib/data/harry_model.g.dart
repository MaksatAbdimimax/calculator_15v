// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarryModel _$HarryModelFromJson(Map<String, dynamic> json) => HarryModel(
  fullName: json['fullName'] as String? ?? "Lala",
  hogwartsHouse: json['hogwartsHouse'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$HarryModelToJson(HarryModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'hogwartsHouse': instance.hogwartsHouse,
      'image': instance.image,
    };
