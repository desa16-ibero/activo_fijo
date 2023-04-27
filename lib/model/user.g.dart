// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<_$_User> {
  @override
  final int typeId = 0;

  @override
  _$_User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_User(
      account: fields[0] as int?,
      digit: fields[1] as String?,
      name: fields[2] as String?,
      keyCareer: fields[3] as int?,
      career: fields[4] as String?,
      keyPlan: fields[5] as int?,
      namePlan: fields[6] as String?,
      hashKiosk: fields[7] as String?,
      password: fields[8] as String?,
      saveSession: fields[9] as bool?,
      profileID: fields[10] as int?,
      profile: fields[11] as String?,
      lastUpdatePassword: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(1)
      ..write(obj.digit)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.keyCareer)
      ..writeByte(4)
      ..write(obj.career)
      ..writeByte(5)
      ..write(obj.keyPlan)
      ..writeByte(6)
      ..write(obj.namePlan)
      ..writeByte(7)
      ..write(obj.hashKiosk)
      ..writeByte(8)
      ..write(obj.password)
      ..writeByte(9)
      ..write(obj.saveSession)
      ..writeByte(10)
      ..write(obj.profileID)
      ..writeByte(11)
      ..write(obj.profile)
      ..writeByte(12)
      ..write(obj.lastUpdatePassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      account: json['account'] as int?,
      digit: json['digit'] as String?,
      name: json['name'] as String?,
      keyCareer: json['keyCareer'] as int?,
      career: json['career'] as String?,
      keyPlan: json['keyPlan'] as int?,
      namePlan: json['namePlan'] as String?,
      hashKiosk: json['hashKiosk'] as String?,
      password: json['password'] as String?,
      saveSession: json['saveSession'] as bool?,
      profileID: json['profileID'] as int?,
      profile: json['profile'] as String?,
      lastUpdatePassword: json['lastUpdatePassword'] == null
          ? null
          : DateTime.parse(json['lastUpdatePassword'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'account': instance.account,
      'digit': instance.digit,
      'name': instance.name,
      'keyCareer': instance.keyCareer,
      'career': instance.career,
      'keyPlan': instance.keyPlan,
      'namePlan': instance.namePlan,
      'hashKiosk': instance.hashKiosk,
      'password': instance.password,
      'saveSession': instance.saveSession,
      'profileID': instance.profileID,
      'profile': instance.profile,
      'lastUpdatePassword': instance.lastUpdatePassword?.toIso8601String(),
    };
