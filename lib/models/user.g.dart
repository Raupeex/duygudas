// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      nickname: json['nickname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      diagnosis: json['diagnosis'] as String,
      medications: json['medications'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'surname': instance.surname,
      'nickname': instance.nickname,
      'phone': instance.phone,
      'email': instance.email,
      'diagnosis': instance.diagnosis,
      'medications': instance.medications,
    };
