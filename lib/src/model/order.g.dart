// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    menu: json['menu'] == null
        ? null
        : Menu.fromJson(json['menu'] as Map<String, dynamic>),
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'menu': instance.menu?.toJson(),
      'amount': instance.amount,
    };
