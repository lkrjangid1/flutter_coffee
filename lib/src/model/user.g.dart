// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    key: json['key'] as String,
    image: json['image'] as String,
    userName: json['userName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'key': instance.key,
      'image': instance.image,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
