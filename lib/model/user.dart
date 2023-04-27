import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'custom_model.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 0, adapterName: 'UserAdapter')
  const factory User({
    @HiveField(0) int? account,
    @HiveField(1) String? digit,
    @HiveField(2) String? name,
    @HiveField(3) int? keyCareer,
    @HiveField(4) String? career,
    @HiveField(5) int? keyPlan,
    @HiveField(6) String? namePlan,
    @HiveField(7) String? hashKiosk,
    @HiveField(8) String? password,
    @HiveField(9) bool? saveSession,
    @HiveField(10) int? profileID,
    @HiveField(11) String? profile,
    @HiveField(12) DateTime? lastUpdatePassword,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User testUser = User(
    account: 206429,
    digit: '6',
    name: 'TOVAR GONZALEZ ANDREA',
    keyCareer: 2304,
    career: 'INGENIERÍA EN MECATRÓNICA Y PRODUCCIÓN',
    keyPlan: 7,
    namePlan: 'SUJ',
    hashKiosk: 'C6F0C7BBB4C8522234BCF231F0EB8F15',
    password: '5602a.To',
    saveSession: true,
    profile: 'Alumno (a)',
    profileID: 21,
    lastUpdatePassword: DateTime.now(),
  );

  static User genericUser = const User(
      account: 0,
      digit: '',
      name: '',
      keyCareer: 0,
      career: '',
      keyPlan: 0,
      namePlan: '',
      hashKiosk: '',
      password: '');

  static Map<String, ItemTextFormField> mTFFLoginUser = {
    'user': ItemTextFormField(
      hint: 'Usuario:',
      inputType: TextInputType.number,
      value: '',
      validations: [
        MinLengthValidator(length: 1),
        RequiredValidator(),
      ],
    ),
    'digit': ItemTextFormField(
      hint: 'Dígito:',
      inputType: TextInputType.text,
      value: '',
      obscureText: false,
      validations: [
        MinLengthValidator(length: 1),
        RequiredValidator(),
      ],
    ),
    'password': ItemTextFormField(
      hint: 'Contraseña:',
      inputType: TextInputType.text,
      value: '',
      obscureText: true,
      validations: [
        MinLengthValidator(length: 1),
        RequiredValidator(),
      ],
    ),
  };

  static final Map<String, String> mapProfilesApp = {
    '24': 'Empleados',
    '29': 'Empleados de prepa ibero',
  };
}
