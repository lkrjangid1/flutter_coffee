// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    menu: json['menu'] == null
        ? null
        : Menu.fromJson(json['menu'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'menu': instance.menu?.toJson(),
      'quantity': instance.quantity,
    };
