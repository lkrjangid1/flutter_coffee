// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map json) {
  return Categories(
    name: json['name'] as String,
    image: json['image'] as String,
    des: json['des'] as String,
  );
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'des': instance.des,
    };
