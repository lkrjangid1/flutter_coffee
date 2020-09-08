// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    name: json['name'] as String,
    image: json['image'] as String,
    price: json['price'] as String,
    des: json['des'] as String,
    menuId: json['menuId'] as String,
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'des': instance.des,
      'menuId': instance.menuId,
    };
