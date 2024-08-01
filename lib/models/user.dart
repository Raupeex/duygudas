import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String avatar;
  final String name;
  final String surname;
  final String nickname;
  final String phone;
  final String email;
  final String diagnosis;
  final String medications;

  User({
    required this.avatar,
    required this.name,
    required this.surname,
    required this.nickname,
    required this.phone,
    required this.email,
    required this.diagnosis,
    required this.medications,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
